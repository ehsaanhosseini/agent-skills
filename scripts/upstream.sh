#!/usr/bin/env bash
# Review-gated upstream vendoring. Never commits, never pushes, never auto-runs.
#   upstream.sh diff  <skill> [ref]   show what upstream changed vs the vendored copy
#   upstream.sh apply <skill> [ref]   shows the diff, then writes ONLY if CONFIRM=<first 12 chars of new sha> is set (feature branch only)
#   upstream.sh table                 print the UPSTREAM.md table from registry/
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
REG="$ROOT/registry/skills.tsv"; SRC="$ROOT/registry/sources.tsv"
CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/agent-skills-upstream"
cmd="${1:-}"; skill="${2:-}"; ref="${3:-}"

field(){ awk -F'\t' -v k="$1" -v c="$2" 'NR>1 && $1==k {print $c}' "$REG"; }
srcf(){ awk -F'\t' -v k="$1" -v c="$2" 'NR>1 && $1==k {print $c}' "$SRC"; }

# Copy skill from a clone at a given sha into $3, dropping evals/ and rewriting
# relative links that escape the skill dir into SHA-pinned upstream URLs.
export_skill(){ # repo_dir sha upath out
  local repo="$1" sha="$2" up="$3" out="$4" url="$5"
  rm -rf "$out"; mkdir -p "$out"
  local strip; strip=$(awk -F/ '{print NF}' <<<"$up")
  git -C "$repo" archive "$sha" "$up" | tar -x --strip-components="$strip" -C "$out"
  rm -rf "$out/evals"
  # Local policy wrapper (registry/policies/<skill>.md) is injected right after the frontmatter.
  local pol="$ROOT/registry/policies/$(basename "$up").md"
  if [ -f "$pol" ]; then
    python3 - "$out/SKILL.md" "$pol" <<'PY2'
import sys,re
p,pol=sys.argv[1:3]; t=open(p,encoding='utf-8').read(); w=open(pol,encoding='utf-8').read()
m=re.match(r'^---\n.*?\n---\n',t,re.S)
open(p,'w',encoding='utf-8').write(t[:m.end()]+"\n"+w+t[m.end():].lstrip("\n"))
PY2
  fi
  python3 - "$out" "$up" "$sha" "$url" <<'PY'
import os,re,sys,posixpath
out,up,sha,url=sys.argv[1:5]
for dp,_,fs in os.walk(out):
    for f in fs:
        if not f.endswith('.md'): continue
        p=os.path.join(dp,f); rel=os.path.relpath(dp,out)
        base=posixpath.normpath(posixpath.join(up,rel)) if rel!='.' else up
        t=open(p,encoding='utf-8').read()
        def fix(m):
            tgt=m.group(2)
            if re.match(r'^(https?:|#|/|mailto:)',tgt): return m.group(0)
            path=posixpath.normpath(posixpath.join(base,tgt.split('#')[0]))
            if path.startswith(up+'/') or path==up: return m.group(0)
            return '%s(%s/blob/%s/%s)'%(m.group(1),url,sha,path)
        n=re.sub(r'(\[[^\]]*\])\(([^)\s]+)\)',fix,t)
        if n!=t: open(p,'w',encoding='utf-8').write(n)
PY
}
fetch(){ # source -> clone dir
  local s="$1" d="$CACHE/$1"; mkdir -p "$CACHE"
  if [ -d "$d/.git" ]; then git -C "$d" fetch -q origin; else git clone -q "$(srcf "$s" 2)" "$d"; fi
  echo "$d"
}
need(){ [ -n "$(field "$skill" 1)" ] || { echo "unknown skill: $skill" >&2; exit 2; }; }

case "$cmd" in
 table)
  echo "| Skill | Source Repository | Upstream Path | Reviewed Commit | Local Status | Notes |"; echo "|---|---|---|---|---|---|"
  awk -F'\t' 'NR==FNR{if(FNR>1)r[$1]=$2;next} FNR>1{printf "| %s | %s | `%s` | `%s` | %s | %s |\n",$1,r[$3],$4,substr($5,1,12),$6,$7}' "$SRC" "$REG";;
 diff|apply)
  need; source_id="$(field "$skill" 3)"; up="$(field "$skill" 4)"; cur="$(field "$skill" 5)"; cat_="$(field "$skill" 2)"
  url="$(srcf "$source_id" 2)"; dest="$ROOT/skills/$cat_/$skill"; repo="$(fetch "$source_id")"
  new="${ref:-${INITIAL:+$cur}}"; new="${new:-$(git -C "$repo" rev-parse origin/HEAD)}"; new="$(git -C "$repo" rev-parse "$new^{commit}")"
  tmp="$(mktemp -d)"; trap 'rm -rf "$tmp"' EXIT
  export_skill "$repo" "$cur" "$up" "$tmp/old" "$url"
  [ -d "$dest" ] || mkdir -p "$dest"   # first import
  if [ -n "$(ls -A "$dest")" ] && ! diff -r "$tmp/old" "$dest" >/dev/null 2>&1; then
    echo "WARNING: vendored copy differs from reviewed upstream $cur (local modifications):"; { diff -ru "$tmp/old" "$dest" | head -40; } || true
    [ "${FORCE:-0}" = 1 ] || { [ "$cmd" = diff ] || { echo "Refusing to overwrite. Re-run with FORCE=1 after reviewing."; exit 3; }; }
  fi
  export_skill "$repo" "$new" "$up" "$tmp/new" "$url"
  echo "== $skill: $cur -> $new"; git -C "$repo" log --oneline "$cur..$new" -- "$up" | head -20
  diff -ruN "$dest" "$tmp/new" || true
  if [ "$cmd" = apply ]; then
    case "$(git -C "$ROOT" branch --show-current)" in main|master|dev) echo "Refusing to apply on a protected branch; use a feature branch." >&2; exit 4;; esac
    if [ "${CONFIRM:-}" != "${new:0:12}" ]; then
      echo "NOT APPLIED. Review the diff above (it is the live, symlinked skill that would change), then re-run with CONFIRM=${new:0:12}" >&2; exit 5
    fi
    rsync -a --delete "$tmp/new/" "$dest/"
    awk -F'\t' -v OFS='\t' -v k="$skill" -v s="$new" '$1==k{$5=s}1' "$REG" > "$REG.new" && mv "$REG.new" "$REG"
    echo "Applied to working tree. Review 'git diff', update UPSTREAM.md (scripts/upstream.sh table), then commit yourself."
  else echo "(diff only; nothing changed)"; fi;;
 *) sed -n '2,6p' "$0"; exit 1;;
esac
