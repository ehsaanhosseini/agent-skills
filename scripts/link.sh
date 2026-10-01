#!/usr/bin/env bash
# Symlink every skill in skills/<category>/<name>/ into the user-level discovery dirs.
#   ~/.agents/skills  -> Codex, Cursor
#   ~/.claude/skills  -> Claude Code (does not read ~/.agents)
# Usage: link.sh [--dry-run] [--unlink]
# Never overwrites a real file/dir or a symlink pointing elsewhere; never touches other entries.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TARGETS=("$HOME/.agents/skills" "$HOME/.claude/skills")
dry=0; unlink=0
for a in "$@"; do case "$a" in --dry-run) dry=1;; --unlink) unlink=1;; *) echo "unknown arg $a" >&2; exit 1;; esac; done
run(){ if [ $dry = 1 ]; then echo "[dry-run] $*"; else "$@"; fi; }
rc=0
for t in "${TARGETS[@]}"; do
  [ $dry = 1 ] || mkdir -p "$t"
  for f in "$ROOT"/skills/*/*/SKILL.md; do
    src="$(dirname "$f")"; name="$(basename "$src")"; dst="$t/$name"
    if [ $unlink = 1 ]; then
      if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then run rm "$dst"; echo "unlinked $dst"; fi
      continue
    fi
    if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then echo "ok       $dst"
    elif [ -e "$dst" ] || [ -L "$dst" ]; then echo "CONFLICT $dst exists and is not our link - skipped" >&2; rc=1
    else run ln -s "$src" "$dst"; echo "linked   $dst -> $src"; fi
  done
done
exit $rc
