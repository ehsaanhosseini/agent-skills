# HoccoTech reusable skills

Public-safe, reusable HoccoTech business-system skills (discovery, BI, KPI, data, workflow, mobile, applied AI). See docs/skill-routing.md.

Candidates (not started): engineering QA, production safety, SEO/AEO/GEO methodology, lead discovery,
lead qualification, outreach, UI review.

Rules:
- One directory per skill: `skills/hoccotech/<skill-name>/SKILL.md` (+ supporting files). `name:` must equal the directory name.
- Reusable workflows only. Project-specific rules stay in each project's own repo.
- No secrets, customer data, credentials, or production URLs containing tokens.
- Add the skill to `registry/skills.tsv` (source `local`), run `scripts/validate.sh` and `scripts/link.sh`.
