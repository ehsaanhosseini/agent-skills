# Security & third-party skill policy

A skill is instructions an agent follows with your permissions. Treat adding one like adding a dependency.

## Before a third-party skill becomes active
1. Clone to a temporary location; do **not** run install commands or any script.
2. Record repo URL, exact commit SHA, licence.
3. Read every `SKILL.md` and supporting file. Inspect for: scripts/executables (sh, py, js/ts), package manifests, hooks, MCP config, network calls, env-var and credential access (`~/.ssh`, `~/.aws`, `~/.config`, `.env`, keychains, tokens), filesystem writes, destructive commands (`rm -rf`, `sudo`, `chmod`, `eval`, `exec`, `curl | bash`), telemetry, and nested instructions that push unsafe behaviour (prompt-injection, "don't tell the user", auto-sending).
4. Anything whose behaviour is not understood is excluded. Popularity is not evidence of safety.
5. Vendor only the approved skill directories (not the upstream's tooling) and record the SHA in `registry/skills.tsv`.

## Updates
Explicit, reviewable, reversible: `scripts/upstream.sh diff`, then `apply` with `CONFIRM=<sha>` on a feature branch, review `git diff` with the checklist above, commit. The reviewed SHA stays pinned until then. No auto-update, no submodules, no network dependency at runtime.

## Override check: a tripwire, not a guarantee
`scripts/validate.sh` scans every file under `skills/` for instruction-override phrasing. It is a regex tripwire that catches careless or lazy injection. It does **not** prove a skill is safe, and a passing run is never a substitute for review.

What it does: matches a fixed set of phrases (finite gaps of up to 400 characters between key terms) after folding HTML entities, Unicode compatibility forms and zero-width/format characters, in two views of each file (Markdown markup replaced by a space, and deleted). It rejects symlinks, Unicode tag characters (invisible text), files containing NUL bytes or a UTF-16/32 byte-order mark (they cannot be scanned), and words that mix Latin with Cyrillic or Greek letters. The only Greek letters allowed next to Latin ones are the unit symbols mu and Omega (including the micro and ohm signs); any other Greek+Latin word, such as `x` followed by a Greek beta, is rejected by design even when legitimate, and the text must be reworded because this rejection cannot be allowlisted. Findings are always fatal, with or without `--strict`. The only exemption is an exact full-line entry in `registry/override-allowlist.tsv`.

Accepted residual risks (it will not catch these):
- Encoded or obfuscated payloads (base64, rot13, other encodings, images, binary files).
- Padding: key terms separated by more than 400 characters, or by a sentence-ending character. The gap must stay finite; an unbounded gap makes the scan quadratic and slow.
- Content spliced between the words of a phrase, such as an HTML comment, a link target, a hyphenated line break or a `<br>` tag.
- Paraphrase, synonyms and non-English text.
- Behaviour hidden in scripts or hooks that is not written as an override phrase. Text in them is scanned, but their logic is not analysed.
- An exact allowlisted line reused elsewhere in the same skill. Allowlist entries are scoped per skill, not per file.

Human review of every vendored or upstream diff, using the checklist above, stays mandatory.

## Repository hygiene
No secrets, tokens, `.env`, cookies, keys, customer data, internal URLs with credentials, logs, screenshots with private data, or AI scratch artifacts. Run `scripts/validate.sh` (includes a secret-pattern scan) before every commit. The GitHub repository must stay PRIVATE.

## Usage rules for specific skills
Enforced by the Local policy block injected into each restricted skill (`registry/policies/`); policies never grant autonomous external actions.
- SEO/GEO: official documentation wins over any skill; no black-hat tactics; no unsupported ranking claims.
- Outreach/prospecting: drafts only, no sending, respect consent/anti-spam law; no bulk personal-data scraping without explicit approval.
- Skills must not run suggested `npx`/installer tools without explicit user approval.
