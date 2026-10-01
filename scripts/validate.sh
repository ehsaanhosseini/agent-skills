#!/usr/bin/env bash
# Read-only verification of the agent-skills installation. Modifies nothing.
#   validate.sh [--strict] [--repo-only] [--online]
#   --strict     dirty git working tree is a FAIL (default: WARN)
#   --repo-only  skip checks of ~/.agents/skills and ~/.claude/skills (e.g. before first link on a new Mac)
#   --online     also verify GitHub visibility is PRIVATE via gh
# Secret matches are reported as file/commit only - values are never printed.
set -uo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"; cd "$ROOT" || exit 2
strict=0; repo_only=0; online=0
for a in "$@"; do case "$a" in --strict) strict=1;; --repo-only) repo_only=1;; --online) online=1;; *) echo "unknown arg $a" >&2; exit 2;; esac; done
fails=0; warns=0
pass(){ echo "PASS  $1"; }; fail(){ echo "FAIL  $1"; fails=$((fails+1)); }; warn(){ echo "WARN  $1"; warns=$((warns+1)); }
REG=registry/skills.tsv; SRC=registry/sources.tsv
LINKDIRS=("$HOME/.agents/skills" "$HOME/.claude/skills")
tab=$'\t'

# 1. canonical repo + layout
[ -d .git ] && [ -d skills ] && [ -f "$REG" ] && [ -f "$SRC" ] && pass "canonical repo present: $ROOT" || fail "canonical repo layout (.git, skills/, registry/*.tsv)"
for f in README.md SECURITY.md UPSTREAM.md .gitignore skills/hoccotech/README.md; do [ -f "$f" ] || fail "missing $f"; done
for c in design marketing seo-geo hoccotech; do [ -d "skills/$c" ] || fail "missing skills/$c"; done

# 2. registry <-> skill directories <-> SKILL.md <-> frontmatter name
reg_names=$(awk -F'\t' 'NR>1{print $1}' "$REG")
bad=0
while IFS=$'\t' read -r skill cat source upath sha status notes; do
  [ "$skill" = skill ] && continue
  d="skills/$cat/$skill"
  [ -f "$d/SKILL.md" ] || { fail "registered skill has no $d/SKILL.md"; bad=1; continue; }
  n=$(awk 'NR>1&&/^---$/{exit} /^name:/{sub(/^name:[ ]*/,"");gsub(/["'"'"']/,"");print}' "$d/SKILL.md")
  [ "$n" = "$skill" ] || { fail "name mismatch in $d/SKILL.md ($n)"; bad=1; }
  case "$status" in active|restricted) ;; *) fail "$skill: bad status '$status'"; bad=1;; esac
  if [ "$source" != local ]; then
    grep -q "^$source$tab" "$SRC" || { fail "$skill: unknown source '$source'"; bad=1; }
    printf '%s' "$sha" | grep -Eq '^[0-9a-f]{40}$' || { fail "$skill: reviewed_sha missing/invalid"; bad=1; }
    [ -n "$upath" ] || { fail "$skill: upstream_path missing"; bad=1; }
  fi
  if [ "$status" = restricted ]; then
    [ -f "registry/policies/$skill.md" ] && grep -q "Local policy (agent-skills" "$d/SKILL.md" || { fail "$skill: restricted but policy not injected in SKILL.md"; bad=1; }
    [ -n "$notes" ] || { fail "$skill: restricted without notes"; bad=1; }
  fi
done < "$REG"
dirs=$(for f in skills/*/*/SKILL.md; do basename "$(dirname "$f")"; done | sort)
[ "$(echo "$reg_names" | sort)" = "$dirs" ] && pass "registry == skill directories ($(echo "$dirs" | wc -l | tr -d ' ') skills)" || { fail "registry and skills/ directories differ"; diff <(echo "$reg_names" | sort) <(echo "$dirs") | head; }
[ -z "$(echo "$dirs" | uniq -d)" ] || fail "duplicate skill names"
[ $bad = 0 ] && pass "registry fields, SKILL.md, frontmatter names, SHA provenance, restricted policies"
for s in $(awk -F'\t' 'NR>1{print $1}' "$SRC"); do [ -f "upstream/$s/LICENSE" ] && [ -f "upstream/$s/PROVENANCE" ] || fail "upstream/$s missing LICENSE/PROVENANCE"; done

# 3. relative links inside skills
python3 - <<'PY' && pass "no broken relative links in skills/" || fail "broken relative links in skills/"
import os,re,sys
bad=0
for dp,_,fs in os.walk('skills'):
    for f in fs:
        if f.endswith('.md'):
            p=os.path.join(dp,f)
            for m in re.finditer(r'\]\(([^)\s#]+)(#[^)]*)?\)',open(p,encoding='utf-8').read()):
                t=m.group(1)
                if re.match(r'^(https?:|mailto:|/)',t): continue
                if not os.path.exists(os.path.normpath(os.path.join(dp,t))): bad+=1; print("  broken:",p,t)
sys.exit(1 if bad else 0)
PY

# 4. installed links
if [ $repo_only = 0 ]; then
  for t in "${LINKDIRS[@]}"; do
    label="${t/#$HOME/~}"; bad=0
    for f in skills/*/*/SKILL.md; do
      src="$ROOT/$(dirname "$f")"; name=$(basename "$src"); l="$t/$name"
      if [ ! -L "$l" ]; then fail "$label/$name is not a symlink / missing"; bad=1; continue; fi
      [ "$(readlink "$l")" = "$src" ] || { fail "$label/$name -> $(readlink "$l") (expected $src)"; bad=1; continue; }
      [ -f "$l/SKILL.md" ] && [ "$(cd "$l" && pwd -P)/SKILL.md" = "$(cd "$src" && pwd -P)/SKILL.md" ] && cmp -s "$l/SKILL.md" "$f" || { fail "$label/$name/SKILL.md does not resolve to canonical file"; bad=1; }
    done
    # managed links = symlinks into this repo; none may be broken or unregistered
    for l in "$t"/*; do
      [ -L "$l" ] || continue; tgt=$(readlink "$l")
      case "$tgt" in "$ROOT"/*) ;; *) continue;; esac
      [ -e "$l" ] || { fail "broken managed symlink $label/$(basename "$l")"; bad=1; }
      echo "$reg_names" | grep -qx "$(basename "$l")" || { fail "managed symlink not in registry: $label/$(basename "$l")"; bad=1; }
    done
    [ $bad = 0 ] && pass "$label: all $(echo "$dirs" | wc -l | tr -d ' ') links resolve to canonical SKILL.md; none broken/unregistered"
  done
  # unmanaged agent dirs left alone
  for d in "$HOME/.claude/skills/synced" "$HOME/.codex/skills/.system" "$HOME/.cursor/skills-cursor"; do [ -e "$d" ] && echo "INFO  untouched app-managed dir present: ${d/#$HOME/~}"; done
fi

# 5. secrets (no scanner required; values never printed)
A='AK''IA[0-9A-Z]{16}'; B='gh[pousr]_[A-Za-z0-9]{30,}'; C='sk-[A-Za-z0-9_-]{20,}'; D='xox[baprs]-[A-Za-z0-9-]{10,}'; E='-----BEGIN [A-Z ]*PRIV''ATE KEY'; F='(api[_-]?key|secret|token|passw(or)?d)["'"'"']?[ ]*[:=][ ]*["'"'"'][A-Za-z0-9/+_-]{16,}["'"'"']'; G='/Users/[A-Za-z0-9._-]+/|/home/[a-z0-9._-]+/'
PAT="$A|$B|$C|$D|$E|$F|$G"
hits=$(git ls-files -z | xargs -0 grep -I -l -i -E "$PAT" 2>/dev/null | grep -v '^scripts/validate.sh$')
[ -z "$hits" ] && pass "tracked files: no secret/credential/machine-path patterns" || { fail "tracked files with secret-like patterns (values redacted):"; echo "$hits" | sed 's/^/        /'; }
forbidden=$(git ls-files | grep -E '(^|/)(\.env(\..*)?|id_rsa.*|id_ed25519.*|.*\.pem|.*\.p12|credentials.*)$')
[ -z "$forbidden" ] && pass "tracked files: no .env/key/credential files" || { fail "forbidden tracked files: $forbidden"; }
hh=$(git rev-list --all | while read -r c; do git grep -I -l -i -E "$PAT" "$c" -- . ':!scripts/validate.sh' 2>/dev/null | sed "s/^\([0-9a-f]\{7\}\)[0-9a-f]*:/\1 /"; done | sort -u)
[ -z "$hh" ] && pass "git history ($(git rev-list --all | wc -l | tr -d ' ') commits): no secret patterns" || { fail "git history hits (commit file; values redacted):"; echo "$hh" | sed 's/^/        /'; }
for tool in gitleaks trufflehog; do
  if command -v $tool >/dev/null 2>&1; then
    case $tool in gitleaks) gitleaks detect --no-banner --redact -s . >/dev/null 2>&1;; trufflehog) trufflehog git "file://$ROOT" --no-update --fail >/dev/null 2>&1;; esac \
      && pass "optional scanner $tool: clean" || fail "optional scanner $tool reported findings (run it manually)"
  else echo "INFO  optional scanner $tool not installed (skipped)"; fi
done

# 6. git state
br=$(git branch --show-current); dirty=$(git status --porcelain | wc -l | tr -d ' ')
echo "INFO  branch: $br; remote: $(git remote get-url origin 2>/dev/null | sed -E 's#https://[^@/]*@#https://#')"
if [ "$dirty" = 0 ]; then pass "git working tree clean"; elif [ $strict = 1 ]; then fail "git working tree has $dirty uncommitted change(s)"; else warn "git working tree has $dirty uncommitted change(s)"; fi
if [ $online = 1 ]; then
  if command -v gh >/dev/null 2>&1; then
    vis=$(gh repo view --json visibility -q .visibility 2>/dev/null)
    [ "$vis" = PRIVATE ] && pass "GitHub repository visibility: PRIVATE" || fail "GitHub visibility is '${vis:-unknown}' (expected PRIVATE)"
  else warn "gh not available; visibility not checked"; fi
fi
echo "----"; [ $fails = 0 ] && echo "RESULT: PASS ($warns warning(s))" || echo "RESULT: FAIL ($fails failed check(s), $warns warning(s))"
exit $((fails>0))
