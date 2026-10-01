#!/usr/bin/env bash
# Read-only inventory of registered skills. No network, no writes.
#   inventory.sh    print a markdown table from registry/skills.tsv
set -uo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REG="$ROOT/registry/skills.tsv"
[ -r "$REG" ] || { echo "inventory: registry/skills.tsv unreadable" >&2; exit 2; }
head -1 "$REG" | grep -q '^skill	category	source	upstream_path	reviewed_sha	status' || { echo "inventory: unexpected registry header" >&2; exit 2; }
echo "| name | category | source | pinned upstream SHA | restricted |"
echo "|---|---|---|---|---|"
total=0; restricted=0
while IFS=$'\t' read -r skill cat source _upath sha _status _notes; do
  [ "$skill" = skill ] && continue
  [ -n "$skill" ] || continue
  r=no; [ -f "$ROOT/registry/policies/$skill.md" ] && { r=yes; restricted=$((restricted+1)); }
  total=$((total+1))
  printf '| %s | %s | %s | %s | %s |\n' "$skill" "$cat" "$source" "${sha:0:12}" "$r"
done < "$REG"
echo
echo "Total: $total skills; restricted: $restricted"
