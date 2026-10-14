# Upstream provenance

Source of truth: `registry/skills.tsv`. Regenerate this table with `scripts/upstream.sh table`.
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
