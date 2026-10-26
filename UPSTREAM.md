# Upstream provenance

Source of truth: `registry/skills.tsv`. Regenerate this table with `scripts/upstream.sh table`.

## Engineering integration (2026-10-26)

Twenty engineering skills are locally authored adaptations informed by Jeffallan/claude-skills at `504bb9a067c5c7ea6bf868c7cc337164b213fa57` (MIT). Their upstream paths, exclusions, and license are in `upstream/jeffallan-claude-skills/PROVENANCE`. No upstream executable or reference file is vendored. These adaptations are not eligible for `scripts/upstream.sh apply`; review a new source commit and adapt manually. See `docs/engineering-skills-vetting.md` for the first integration, `docs/jeffallan-candidate-assessment.md` for the full 12-candidate review, and `docs/postgres-devops-coverage.md` for the later specialist split.
Local modifications to vendored skills: `evals/` directories not vendored; relative links pointing outside the skill
directory (`../../tools/...`) rewritten to URLs pinned to the reviewed commit; for `restricted` skills, a Local policy block
(`registry/policies/<skill>.md`) injected after the frontmatter. The 2026-10-14 design additions are separately documented below; adapted skills are locally authored and are not eligible for the verbatim upstream update command.

Audit (2026-10-01): all vendored skills are Markdown only. No scripts, hooks, MCP config, package manifests or network
calls. Not vendored and not audited/executed: marketingskills `tools/`, `scripts/`, `validate-*.sh`; emilkowalski `.pl`.
Rejected: `find-animation-opportunities` (overlaps `improve-animations`). Not selected: `animation-vocabulary`, `animate-expo`,
`write-swift`, `ask-sonner`, and the other marketingskills skills outside the shortlist.


## Design integration (2026-10-14)

- `frontend-design` is a pinned, verbatim Anthropic skill with its Apache-2.0 license in the skill folder.
- `data-dashboard`, `design-critique`, `a11y-audit`, `design-qa`, `design-tokens`, and `design-component` are locally authored, XIAS-informed adaptations. They do not require the XIAS kit or execute its hooks/gates.
- `react-performance` and `react-composition` are locally authored, Vercel-informed adaptations, scoped to the project's actual React/Next versions. No Vercel files or runtime fetch are bundled.
- `design-reference-search` includes eight unmodified Pro Max CSV files and a locally authored, offline search script. Results are references to inspect, not automatic design prescriptions.
- `prototype/JOURNEY-TESTS.md` and one link in its SKILL.md are a local adaptation informed by XIAS; the original prototype workflow remains in place. Do not run `upstream.sh apply prototype` without reviewing this local change.
- Source commits, copied paths, exclusions, and license evidence are in `upstream/*/PROVENANCE`.

| Skill | Source Repository | Upstream Path | Reviewed Commit | Local Status | Notes |
|---|---|---|---|---|---|
| product-marketing | https://github.com/coreyhaines31/marketingskills | `skills/product-marketing` | `5b2c0007766c` | restricted | Writes .agents/product-marketing.md into the current project only when invoked; links rewritten |
| content-strategy | https://github.com/coreyhaines31/marketingskills | `skills/content-strategy` | `5b2c0007766c` | active | tools/ links rewritten to pinned upstream URLs |
| customer-research | https://github.com/coreyhaines31/marketingskills | `skills/customer-research` | `5b2c0007766c` | active | tools/ links rewritten to pinned upstream URLs |
| competitor-profiling | https://github.com/coreyhaines31/marketingskills | `skills/competitor-profiling` | `5b2c0007766c` | restricted | Public information only |
| prospecting | https://github.com/coreyhaines31/marketingskills | `skills/prospecting` | `5b2c0007766c` | restricted | Follow references/compliance.md; no bulk personal-data scraping without explicit approval; tools/ links rewritten |
| cold-email | https://github.com/coreyhaines31/marketingskills | `skills/cold-email` | `5b2c0007766c` | restricted | Draft only; never send without explicit user approval |
| cro | https://github.com/coreyhaines31/marketingskills | `skills/cro` | `5b2c0007766c` | active |  |
| analytics | https://github.com/coreyhaines31/marketingskills | `skills/analytics` | `5b2c0007766c` | restricted | Respect consent/privacy law before adding tracking |
| seo-audit | https://github.com/coreyhaines31/marketingskills | `skills/seo-audit` | `5b2c0007766c` | active | Official search-engine docs are authoritative |
| ai-seo | https://github.com/coreyhaines31/marketingskills | `skills/ai-seo` | `5b2c0007766c` | restricted | Workflow aid only; do not run suggested npx tools without approval; no unsupported ranking claims; tools/ link rewritten |
| schema | https://github.com/coreyhaines31/marketingskills | `skills/schema` | `5b2c0007766c` | active | Validate against schema.org / Google docs |
| site-architecture | https://github.com/coreyhaines31/marketingskills | `skills/site-architecture` | `5b2c0007766c` | active |  |
| emil-design-eng | https://github.com/emilkowalski/skills | `skills/emil-design-eng` | `d16ebe60d09a` | active |  |
| apple-design | https://github.com/emilkowalski/skills | `skills/apple-design` | `d16ebe60d09a` | active |  |
| animate | https://github.com/emilkowalski/skills | `skills/animate` | `d16ebe60d09a` | active |  |
| review-animations | https://github.com/emilkowalski/skills | `skills/review-animations` | `d16ebe60d09a` | active | Manual-invocation only (upstream flag) |
| improve-animations | https://github.com/emilkowalski/skills | `skills/improve-animations` | `d16ebe60d09a` | restricted | Writes plan files under plans/ in the target project; read-only on source |
| prototype | https://github.com/emilkowalski/skills | `skills/prototype` | `d16ebe60d09a` | restricted | Manual-invocation only; adds then deletes a prototype route in the target project |
| pick-ui-library | https://github.com/emilkowalski/skills | `skills/pick-ui-library` | `d16ebe60d09a` | active | Manual-invocation only (upstream flag) |
| mobile-native | https://github.com/emilkowalski/skills | `skills/mobile-native` | `d16ebe60d09a` | active |  |
| frontend-design | https://github.com/anthropics/skills | `skills/frontend-design` | `dbd4588f9e10` | active | Pinned standalone web art direction; upstream Apache-2.0 license retained |
| data-dashboard | Local adaptation | `-` | `-` | active | Original XIAS-informed dashboard workflow; no kit dependency |
| design-critique | Local adaptation | `-` | `-` | active | Original XIAS-informed rendered critique |
| a11y-audit | Local adaptation | `-` | `-` | active | Evidence-led accessibility audit; no external engine bundled |
| design-qa | Local adaptation | `-` | `-` | active | Project-aware measurable checks; no automatic installation |
| design-tokens | Local adaptation | `-` | `-` | active | Semantic token architecture for web Figma and Flutter |
| design-component | Local adaptation | `-` | `-` | active | Component anatomy states accessibility and API |
| react-performance | Local adaptation | `-` | `-` | active | React/Next only; original Vercel-informed adaptation |
| react-composition | Local adaptation | `-` | `-` | active | React only; original Vercel-informed adaptation |
| design-reference-search | Local adaptation | `-` | `-` | active | Offline Pro Max CSV subset and bounded local search |
| figma-deliverables | Local adaptation | `-` | `-` | active | Cross-platform Figma handoff orchestration; mobile-first and standard tracks; native apps in same project |
| typescript-safety | https://github.com/Jeffallan/claude-skills | `skills/typescript-pro` | `504bb9a067c5` | active | Locally authored adaptation; runtime boundary validation and scoped type checks |
| postgres-query-review | https://github.com/Jeffallan/claude-skills | `skills/postgres-pro` | `504bb9a067c5` | restricted | Locally authored adaptation; plan first; database operations follow project controls |
| security-code-review | https://github.com/Jeffallan/claude-skills | `skills/security-reviewer` | `504bb9a067c5` | restricted | Locally authored adaptation; scoped source review; active testing separately authorized |
| nextjs-developer | https://github.com/Jeffallan/claude-skills | `skills/nextjs-developer` | `504bb9a067c5` | active | Locally authored adaptation; version-aware App Router and Pages Router workflow |
| api-designer | https://github.com/Jeffallan/claude-skills | `skills/api-designer` | `504bb9a067c5` | active | Locally authored adaptation; contract and compatibility workflow; RFC 9457 |
| architecture-designer | https://github.com/Jeffallan/claude-skills | `skills/architecture-designer` | `504bb9a067c5` | active | Locally authored adaptation; decision and failure-mode workflow |
| test-master | https://github.com/Jeffallan/claude-skills | `skills/test-master` | `504bb9a067c5` | restricted | Locally authored adaptation; risk-based testing; load and security tests controlled |
| playwright-expert | https://github.com/Jeffallan/claude-skills | `skills/playwright-expert` | `504bb9a067c5` | restricted | Locally authored adaptation; browser testing; authorized test targets only |
| monitoring-expert | https://github.com/Jeffallan/claude-skills | `skills/monitoring-expert` | `504bb9a067c5` | restricted | Locally authored adaptation; observability; privacy and rollout controls |
| spec-miner | https://github.com/Jeffallan/claude-skills | `skills/spec-miner` | `504bb9a067c5` | active | Locally authored adaptation; evidence-backed specification recovery |
| postgres-concurrency | https://github.com/Jeffallan/claude-skills | `skills/postgres-pro` | `504bb9a067c5` | restricted | Locally authored specialist adaptation; MVCC isolation locking and concurrency |
| postgres-schema-migrations | https://github.com/Jeffallan/claude-skills | `skills/postgres-pro` | `504bb9a067c5` | restricted | Locally authored specialist adaptation; schema invariants and migration safety |
| postgres-reliability | https://github.com/Jeffallan/claude-skills | `skills/postgres-pro` | `504bb9a067c5` | restricted | Locally authored specialist adaptation; WAL replication backup and recovery |
| postgres-capacity | https://github.com/Jeffallan/claude-skills | `skills/postgres-pro` | `504bb9a067c5` | restricted | Locally authored specialist adaptation; pooling telemetry and capacity |
| ci-cd-engineering | https://github.com/Jeffallan/claude-skills | `skills/devops-engineer` | `504bb9a067c5` | restricted | Locally authored specialist adaptation; pipeline gates and artifact provenance |
| container-engineering | https://github.com/Jeffallan/claude-skills | `skills/devops-engineer` | `504bb9a067c5` | restricted | Locally authored specialist adaptation; image and runtime review |
| infrastructure-code-review | https://github.com/Jeffallan/claude-skills | `skills/devops-engineer` | `504bb9a067c5` | restricted | Locally authored specialist adaptation; IaC plan and state review |
| deployment-recovery | https://github.com/Jeffallan/claude-skills | `skills/devops-engineer` | `504bb9a067c5` | restricted | Locally authored specialist adaptation; rollout and rollback planning |
| configuration-secrets | https://github.com/Jeffallan/claude-skills | `skills/devops-engineer` | `504bb9a067c5` | restricted | Locally authored specialist adaptation; environment configuration and credential lifecycle |
| incident-runbooks | https://github.com/Jeffallan/claude-skills | `skills/devops-engineer` | `504bb9a067c5` | restricted | Locally authored specialist adaptation; incident diagnosis and recovery |
