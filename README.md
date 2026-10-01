# agent-skills

One curated, audited Agent Skills library shared by Claude Code, OpenAI Codex and Cursor on this Mac.
No per-project copies.

```
private GitHub repo (source of truth)
   -> local clone: ~/Dev Projects/agent-skills   (runtime library; GitHub is NOT a runtime dependency)
   -> per-skill symlinks in ~/.agents/skills and ~/.claude/skills
   -> Claude Code + Codex + Cursor -> every project
```

## Layout
| Path | Purpose |
|---|---|
| `skills/<category>/<skill>/` | Skill packages (`SKILL.md` + supporting files). Categories: `design`, `marketing`, `seo-geo`, `hoccotech` (private). |
| `registry/skills.tsv` | Every skill: category, source, upstream path, reviewed SHA, status, notes. |
| `registry/sources.tsv` | Upstream repositories + licence. |
| `upstream/<source>/` | Upstream LICENSE + PROVENANCE only (skills live under `skills/`). |
| `scripts/` | `link.sh`, `validate.sh`, `upstream.sh`. |
| `UPSTREAM.md`, `SECURITY.md` | Provenance table; third-party review policy. |

## How each agent discovers the skills
Verified against current official docs (2026-10-01):
- **Claude Code** reads `~/.claude/skills/<name>/SKILL.md` only (not `~/.agents`). Symlinked skill folders are followed. `link.sh` creates one symlink per skill.
- **Codex** reads `$HOME/.agents/skills` and follows symlinks. `link.sh` creates the same per-skill symlinks there.
- **Cursor** reads `~/.agents/skills`, `~/.cursor/skills`, and (compat) `~/.claude/skills` / `~/.codex/skills`. It uses `~/.agents/skills`; because it also scans `~/.claude/skills` it may list a skill twice, but both entries are symlinks to the one canonical file.

Links are flat (`~/.agents/skills/<name>`) even though the repo is categorised, because agents expect `<root>/<name>/SKILL.md`.
Existing app-managed entries (`~/.claude/skills/synced`, `~/.codex/skills/.system`, `~/.cursor/skills-cursor`) are never touched.

## Common tasks
**Install on a new Mac**
```bash
mkdir -p ~/Dev && git clone git@github.com:<you>/agent-skills.git ~/Dev/agent-skills   # or any path
cd ~/Dev/agent-skills && scripts/validate.sh && scripts/link.sh --dry-run && scripts/link.sh
```
`link.sh` skips (and reports) any name that already exists and is not its own link.

**Add a skill**: create `skills/<category>/<name>/SKILL.md` (frontmatter `name` = directory name), add a row to `registry/skills.tsv` (source `local`), then `scripts/validate.sh && scripts/link.sh`, commit on a branch.

**Add a third-party skill**: audit it first (see SECURITY.md), add rows to `registry/skills.tsv` with the reviewed SHA, run `INITIAL=1 scripts/upstream.sh apply <skill>`, regenerate the UPSTREAM.md table.

**Update / audit an upstream skill**
```bash
scripts/upstream.sh diff  <skill> [ref]   # fetches upstream, shows commits + file diff; changes nothing
scripts/upstream.sh apply <skill> [ref]   # writes into the working tree + bumps reviewed SHA; never commits/pushes
git diff                                   # review, including scripts/hooks/network/credential changes (SECURITY.md)
scripts/upstream.sh table                  # refresh the UPSTREAM.md table
```
`apply` refuses if the vendored copy has local edits beyond the documented link rewrite (override with `FORCE=1` after review). Nothing runs on shell startup.
Roll back with `git revert` / `git checkout -- skills/...`.

**Disable / remove a skill**: `rm ~/.agents/skills/<name> ~/.claude/skills/<name>` (symlinks only), or delete the skill from the repo and its registry row. `scripts/link.sh --unlink` removes all links this repo made.

**Provenance**: `registry/skills.tsv` holds the exact reviewed upstream commit per skill; `upstream/<source>/PROVENANCE` and LICENSE are kept; the only local modification to upstream skills is rewriting links that escaped the skill dir into SHA-pinned upstream URLs, and dropping `evals/`.

## Notes
- Skills with `disable-model-invocation: true` upstream only run when invoked explicitly.
- "restricted" skills in the registry have usage limits recorded in `notes`.
- SEO/GEO skills are workflow aids; official search-engine documentation is authoritative.
