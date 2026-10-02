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

# 3b. instruction-override tripwire over every file under skills/. Always fatal (--strict does not change this).
# A regex tripwire, not a guarantee: see SECURITY.md for residual risks. Multi-line aware (whole-file normalized text) and scanned in
# two views (markup chars -> space, markup chars deleted). Lines are folded first (HTML entities, NFKC, format chars dropped).
# Also fatal: symlinks, Unicode tag characters, NUL/UTF-16/32 files, words mixing Latin with Greek/Cyrillic (mu/Omega unit symbols excepted). Allowlist = exact full source line per skill; stale/malformed entries fail.
python3 - registry/override-allowlist.tsv <<'PY' && pass "no unreviewed instruction-override patterns in skills/" || fail "unreviewed instruction-override patterns or invalid override allowlist"
import bisect,codecs,html,os,re,string,sys,unicodedata
allow_path=sys.argv[1]
PATS=[r"ignore (?:[a-z]+ ){0,3}(previous|prior|above|earlier|preceding) (instructions|rules|guidelines|prompts|directions)",
 r"disregard [^.!?]{0,400}(system|session|instructions)",r"override [^.!?]{0,400}(system|session|instructions)",
 r"spawn [^.!?]{0,400}sub-?agents?",r"without (asking|confirmation|permission)",r"do not (ask|tell) the user",
 r"treat [^.!?]{0,400} as (user )?permission",r"you are now (in )?(developer|dan|jailbreak) mode"]
rx=re.compile("|".join("(?:%s)"%q for q in PATS),re.I)
norm=lambda s:re.sub(r"\s+"," ",s).strip()
fold=lambda s:"".join(c for c in unicodedata.normalize("NFKC",html.unescape(s)) if unicodedata.category(c)!="Cf")
MD=re.compile(r"[*_`~|\\\[\]()<>#]")
WORD=re.compile(r"\w+"); LAT=frozenset(string.ascii_letters); UNITS=frozenset(chr(c) for c in (0x3bc,0x3a9))  # mu, Omega: unit symbols
TAGS=re.compile("[%s-%s]"%(chr(0xe0000),chr(0xe007f))); BOMS=(codecs.BOM_UTF16_LE,codecs.BOM_UTF16_BE,codecs.BOM_UTF32_LE,codecs.BOM_UTF32_BE)
def mixed(t):  # linear: one pass over words, set membership per word (no nested scans)
    for m in WORD.finditer(t):
        u=set(m.group())
        if u&LAT and any(0x400<=ord(c)<=0x4ff or (0x370<=ord(c)<=0x3ff and c not in UNITS) for c in u): return True
    return False
MARK=re.compile(r"^(?:\s*(?:>|[-*+](?=\s)|\d+[.)](?=\s)))+")
bad=0; allow={}
if not os.path.isfile(allow_path): print("  missing",allow_path); sys.exit(1)
rows=open(allow_path,encoding="utf-8").read().splitlines()
if not rows or rows[0].split("\t")!=["skill","exact_line","justification"]:
    print("  allowlist header must be: skill<TAB>exact_line<TAB>justification"); bad+=1
for i,l in enumerate(rows[1:],2):
    if not l.strip(): continue
    c=l.split("\t")
    if len(c)!=3 or not all(x.strip() for x in c): print("  allowlist line %d malformed (need 3 non-empty columns)"%i); bad+=1; continue
    allow[(c[0].strip(),norm(c[1]))]=i
seen=set()
for dp,dn,fs in os.walk("skills"):
    for d in dn:
        if os.path.islink(os.path.join(dp,d)): print("  symlinked directory not allowed: %s"%os.path.join(dp,d)); bad+=1
    for f in sorted(fs):
        p=os.path.join(dp,f); parts=p.split(os.sep); skill=parts[1+1] if len(parts)>3 else ""
        if os.path.islink(p): print("  symlink not allowed: %s"%p); bad+=1; continue
        raw=open(p,"rb").read()
        if b"\0" in raw or raw.startswith(BOMS): print("  NUL bytes or UTF-16/32 BOM (unscannable encoding): %s"%p); bad+=1; continue
        try: lines=raw.decode("utf-8",errors="strict" if f.endswith(".md") else "replace").splitlines()
        except UnicodeDecodeError: print("  invalid UTF-8 in markdown file: %s"%p); bad+=1; continue
        if TAGS.search(html.unescape("".join(lines))): print("  Unicode tag characters (invisible text): %s"%p); bad+=1
        if any(mixed(fold(l)) for l in lines): print("  word mixing Latin with Greek/Cyrillic (homoglyph?): %s"%p); bad+=1
        hits={}
        for view in (" ",""):
            text="";starts=[];lineno=[]
            for n,line in enumerate(lines,1):
                seen.add((skill,norm(line)))
                s=norm(MD.sub(view,fold(MARK.sub("",line))))
                if not s: continue
                if text: text+=" "
                starts.append(len(text)); lineno.append(n); text+=s
            for m in rx.finditer(text):
                a=bisect.bisect_right(starts,m.start())-1; e=bisect.bisect_right(starts,max(m.end()-1,m.start()))-1
                hits.setdefault((lineno[a],lineno[e]),m.group(0)[:90])
        for (la,le),g in sorted(hits.items()):
            if la==le and (skill,norm(lines[la-1])) in allow: continue
            print("  override pattern: %s:%d (%s) \"%s\""%(p,la,"single-line" if la==le else "multi-line, to line %d"%le,g)); bad+=1
for (s,l),i in allow.items():
    if (s,l) not in seen: print("  stale allowlist entry (line %d, skill %s): no such source line"%(i,s)); bad+=1
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
