# Security & third-party skill policy

A skill is instructions an agent follows with your permissions. Treat adding one like adding a dependency.

## Before a third-party skill becomes active
1. Clone to a temporary location; do **not** run install commands or any script.
2. Record repo URL, exact commit SHA, licence.
3. Read every `SKILL.md` and supporting file. Inspect for: scripts/executables (sh, py, js/ts), package manifests, hooks, MCP config, network calls, env-var and credential access (`~/.ssh`, `~/.aws`, `~/.config`, `.env`, keychains, tokens), filesystem writes, destructive commands (`rm -rf`, `sudo`, `chmod`, `eval`, `exec`, `curl | bash`), telemetry, and nested instructions that push unsafe behaviour (prompt-injection, "don't tell the user", auto-sending).
4. Anything whose behaviour is not understood is excluded. Popularity is not evidence of safety.
5. Vendor only the approved skill directories (not the upstream's tooling) and record the SHA in `registry/skills.tsv`.

## Updates
Explicit, reviewable, reversible: `scripts/upstream.sh diff` then `apply`, review `git diff` with the checklist above, commit on a branch. No auto-update, no submodules, no network dependency at runtime.

## Repository hygiene
No secrets, tokens, `.env`, cookies, keys, customer data, internal URLs with credentials, logs, screenshots with private data, or AI scratch artifacts. Run `scripts/validate.sh` (includes a secret-pattern scan) before every commit. The GitHub repository must stay PRIVATE.

## Usage rules for specific skills
- SEO/GEO: official documentation wins over any skill; no black-hat tactics; no unsupported ranking claims.
- Outreach/prospecting: drafts only, no sending, respect consent/anti-spam law; no bulk personal-data scraping without explicit approval.
- Skills must not run suggested `npx`/installer tools without explicit user approval.
