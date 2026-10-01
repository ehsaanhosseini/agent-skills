#!/usr/bin/env bash
# Repo sanity checks: frontmatter, unique names, relative links, registry coverage, secret patterns.
set -uo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"; cd "$ROOT"; fail=0
names=$(for f in skills/*/*/SKILL.md; do d=$(basename "$(dirname "$f")"); n=$(awk 'NR>1&&/^---$/{exit} /^name:/{sub(/^name:[ ]*/,"");gsub(/["'"'"']/,"");print}' "$f"); [ "$n" = "$d" ] || { echo "name mismatch: $f ($n != $d)"; fail=1; }; echo "$d"; done)
dups=$(echo "$names" | sort | uniq -d); [ -z "$dups" ] || { echo "duplicate skill names: $dups"; fail=1; }
for s in $(awk -F'\t' 'NR>1{print $1}' registry/skills.tsv); do ls -d skills/*/$s >/dev/null 2>&1 || { echo "registry entry without skill: $s"; fail=1; }; done
for n in $names; do grep -q -P "^$n\t" registry/skills.tsv 2>/dev/null || grep -q "^$n	" registry/skills.tsv || [ -f "skills/hoccotech/$n/SKILL.md" ] || { echo "skill not in registry: $n"; fail=1; }; done
python3 - <<'PY' || fail=1
import os,re,sys
bad=0
for dp,_,fs in os.walk('skills'):
    for f in fs:
        if f.endswith('.md'):
            p=os.path.join(dp,f)
            for m in re.finditer(r'\]\(([^)\s#]+)(#[^)]*)?\)',open(p,encoding='utf-8').read()):
                t=m.group(1)
                if re.match(r'^(https?:|mailto:|/)',t): continue
                if not os.path.exists(os.path.normpath(os.path.join(dp,t))): bad+=1; print("broken link:",p,t)
sys.exit(1 if bad else 0)
PY
if grep -rIn -E 'AKIA[0-9A-Z]{16}|gh[pousr]_[A-Za-z0-9]{30,}|sk-[A-Za-z0-9]{20,}|xox[baprs]-[A-Za-z0-9-]{10,}|-----BEGIN [A-Z ]*PRIVATE KEY|/Users/[a-z]+/' --exclude-dir=.git . ; then echo "possible secret / machine path found"; fail=1; fi
[ $fail = 0 ] && echo "validate: PASS ($(echo "$names" | wc -l | tr -d ' ') skills)" || echo "validate: FAIL"; exit $fail
