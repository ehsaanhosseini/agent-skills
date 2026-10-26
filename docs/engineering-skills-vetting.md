# Engineering skills upgrade — vetting record

Status: review only; no upstream skill installed or enabled.

## Source
- Upstream: https://github.com/Jeffallan/claude-skills
- License: MIT (verify per-file attribution before import)
- Target: existing cross-agent skill registry; preserve all current skills and symlinks.

## First candidates
1. TypeScript Pro — type-safety, boundary validation.
2. PostgreSQL Pro — safe query/index analysis, migration planning.
3. Security Reviewer — threat modeling and code review.
4. Test Master — evidence-backed regression gates.
5. Debugging Wizard — root-cause analysis.
6. Next.js Developer — version-specific App Router guidance.

## Vetting gates
- Read full SKILL.md and every referenced file; review scripts/hooks and indirect instructions.
- Pin source commit and record provenance/license in UPSTREAM.md and registry/skills.tsv.
- Check overlap against existing 31 skills and merge guidance rather than duplicating.
- Strip unconditional production actions, deployment instructions and unsafe assumptions.
- Explicitly forbid autonomous production/main changes, destructive database actions, secret exposure, and bypass of approvals.
- Validate skill frontmatter, trigger specificity, references, local links and cross-agent compatibility.
- Run scripts/validate.sh --strict --repo-only; run --online when available.
- Confirm all existing registered skills remain unchanged and pass validation.
- Require owner review before merging into dev; main remains owner-approved only.

## Observed upstream caveats
- Next.js Developer mandates loading/error files for every async route segment; treat as context-dependent.
- PostgreSQL Pro prescribes EXPLAIN ANALYZE and operational maintenance; require safe environment, permissions and plan-first gates.
- Popularity and CI presence are not security assurances.

Next step: inspect candidate full content and references, then submit a separate implementation change after vetting.