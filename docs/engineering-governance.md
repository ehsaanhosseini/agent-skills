# Engineering skill governance

## Ownership and changes

The repository owner in `.github/CODEOWNERS` maintains registry, CI, and release integrity and approves merges to `main`. A skill change PR names a maintenance owner or accountable reviewer for the domain, the affected skill IDs, source versions, behavior fixtures and security impact. Until stable specialist teams exist, the PR review record is the domain-ownership source. PR history and `registry/skills.tsv` provide change history; do not edit past audit records to pretend an earlier decision was never made.

Use reviewable commits for content, tests and governance. Keep protected baseline IDs in `registry/protected-skill-ids.txt`; a missing ID fails CI. An intentional deprecation needs a PR with replacement routing, consumer migration, link compatibility, reason, owner approval and a removal date. A deprecated skill should first remain present with a clear pointer and no degraded safety instructions. Never delete a skill silently or repurpose its name for a different task.

## Freshness policy

- Pin every upstream source commit and license. Review new upstream content as untrusted; never automatically copy scripts, hooks or operational commands.
- Check version-sensitive claims against official documentation when editing a skill and at least every six months for PostgreSQL, React/Next.js, Docker, GitHub Actions and IaC. Security or breaking upstream notices trigger earlier review.
- Record supported major versions or the rule to inspect the installed version. A `/current/` documentation link is a navigation aid, not proof that the local system runs that version.
- Review action pins, dependency runtimes and example commands quarterly. A pinned artifact stays immutable but can become outdated.
- Keep source freshness and behavior evaluation separate: fresh docs do not prove an agent follows the skill.

## Release path

Feature branch → PR into `dev` → required CI, source/security review and representative behavior evidence → merge `dev` → verify merged `dev` → update `dev`→`main` PR. Only the owner explicitly approves `main`; sync the canonical local checkout only after that merge and a clean-state check. If CI or an agent runtime is unavailable, report it and do not substitute a structural pass for behavioral evidence.

## Portable skill contract

Use Agent Skills `name` and `description` frontmatter, relative references and ordinary project-native commands. Claude Code, Codex and Cursor may discover through different paths; test local links and actual behavior where runtime access exists. Agent-specific permissions, hooks or model settings must not become a dependency for a core workflow. A skill's examples are guidance, not authorization to run privileged operations.
