# agent-skills

One curated, audited Agent Skills library shared by Claude Code, OpenAI Codex and Cursor on this Mac.
No per-project copies.

```
private GitHub repo (source of truth, backup, sharing)
   -> canonical local clone: ~/Dev Projects/agent-skills   (the runtime library)
        -> ~/.agents/skills/<name>  symlinks: Codex, Cursor and other agents that read the shared path
        -> ~/.claude/skills/<name>  symlinks: Claude Code (reads only this path)
   -> all local projects (no per-project copies)
```

- **GitHub is not a runtime dependency.** Agents read the local clone; nothing is fetched at runtime or on shell startup.
- **Upstream updates are review-gated** (see below). Nothing updates itself.
- **Project-specific rules stay inside their projects.** Global skills hold reusable workflows only.
- **Restricted skills do not grant autonomous external actions** (sending, scraping, tracking changes, writing into projects). See "Restricted skills".

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
- **Cursor** reads `~/.agents/skills` and `~/.cursor/skills`, and, "for compatibility", `~/.claude/skills` and `~/.codex/skills`. Its intended route here is `~/.agents/skills`. Because it also scans `~/.claude/skills`, the same skill is reachable by two paths. Whether Cursor de-duplicates them is **UNRESOLVED**: the docs are silent and it cannot be tested without driving the Cursor UI. If duplicates ever appear in Cursor, both entries are symlinks to the same canonical file (no divergent copies), so the impact is cosmetic; Claude Code needs `~/.claude/skills`, so it is not removed.

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
CONFIRM=<12-char sha shown> scripts/upstream.sh apply <skill> [ref]   # shows diff first; writes only with the matching CONFIRM; refuses on main/master
git diff                                   # review, including scripts/hooks/network/credential changes (SECURITY.md)
scripts/upstream.sh table                  # refresh the UPSTREAM.md table
```
`apply` runs on a feature branch only, never commits or pushes, and refuses if the vendored copy has local edits beyond the documented link rewrite and policy block (override with `FORCE=1` after review). The reviewed SHA in the registry stays pinned until an apply succeeds. Nothing runs on shell startup.
Roll back with `git revert` / `git checkout -- skills/...`.

**Disable / remove a skill**: `rm ~/.agents/skills/<name> ~/.claude/skills/<name>` (symlinks only), or delete the skill from the repo and its registry row. `scripts/link.sh --unlink` removes all links this repo made.

**Provenance**: `registry/skills.tsv` holds the exact reviewed upstream commit per skill; `upstream/<source>/PROVENANCE` and LICENSE are kept; the only local modification to upstream skills is rewriting links that escaped the skill dir into SHA-pinned upstream URLs, and dropping `evals/`.

## Restricted skills
Skills marked `restricted` in `registry/skills.tsv` carry a **Local policy** block, injected right after the frontmatter of their `SKILL.md` (so the agent reads it before the upstream body). The policy text lives in `registry/policies/<skill>.md`, is re-applied automatically by `scripts/upstream.sh` on every update, and `validate.sh` fails if it is missing. Upstream text is otherwise unchanged. These are instructions to the agent, not a technical sandbox: your agent permission settings remain the enforcement layer.

`product-marketing` writes business context to `.agents/product-marketing.md` in the **current project** (only when that skill runs, and only after approval per its policy). That file holds positioning/ICP/competitor information. This repo does not decide whether a project commits or ignores it; decide per project (and never add it to a global gitignore).

## Validate
`scripts/validate.sh [--strict] [--repo-only] [--online]` is read-only: registry/skill/provenance consistency, link integrity for both discovery dirs, secret-pattern scan of tracked files and history (no scanner needed; gitleaks/trufflehog are used if installed), git state, and (with `--online`) that the GitHub repo is PRIVATE. It also runs an instruction-override tripwire over every file under `skills/`; this is a regex check that catches careless injection only, not a guarantee, and human review of every vendored or upstream diff stays mandatory (accepted residual risks: see `SECURITY.md`). Regression tests for the tripwire: `python3 tests/override_scanner_test.py` (builds its payloads at runtime in a temp directory).

## Notes
- Skills with `disable-model-invocation: true` upstream only run when invoked explicitly.
- "restricted" skills in the registry have usage limits recorded in `notes`.
- SEO/GEO skills are workflow aids; official search-engine documentation is authoritative.
