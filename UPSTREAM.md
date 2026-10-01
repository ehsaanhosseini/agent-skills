# Upstream provenance

Source of truth: `registry/skills.tsv`. Regenerate this table with `scripts/upstream.sh table`.
Local modifications to vendored skills: `evals/` directories not vendored; relative links pointing outside the skill
directory (`../../tools/...`) rewritten to URLs pinned to the reviewed commit; for `restricted` skills, a Local policy block
(`registry/policies/<skill>.md`) injected after the frontmatter. Nothing else changed.

Audit (2026-10-01): all vendored skills are Markdown only. No scripts, hooks, MCP config, package manifests or network
calls. Not vendored and not audited/executed: marketingskills `tools/`, `scripts/`, `validate-*.sh`; emilkowalski `.pl`.
Rejected: `find-animation-opportunities` (overlaps `improve-animations`). Not selected: `animation-vocabulary`, `animate-expo`,
`write-swift`, `ask-sonner`, and the other marketingskills skills outside the shortlist.

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
