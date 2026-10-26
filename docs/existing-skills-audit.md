# Existing skill engineering audit

Baseline: 34 skills at `dev` commit `ab82c3c451ec9749471b0a23f7b700a13d19253b`. All entrypoints, local references, scripts, registry routes, and restricted policies were inspected. Ratings judge the current baseline, before this branch's engineering upgrades: **Strong** = actionable, bounded and verifiable; **Adequate** = useful but material gaps; **Weak** = insufficient guidance for independent professional use. Priority P0 warrants correction before relying on the skill for consequential work; P1 is the next quality pass; P2 is maintenance. A rating is a review judgment, not a measured agent success rate. No baseline skill is deleted.

| Skill | Evidence inspected | Rating | Gap / concrete remediation | Priority |
|---|---|---|---|---|
| `analytics` | 315-line entrypoint; GA4, GTM, event-library references; restricted policy | Adequate | Add consent-mode and server-side identity examples, data QA fixtures, and current vendor-version checks. | P1 |
| `cold-email` | 165-line entrypoint; five framework/benchmark references; restricted policy | Adequate | Date benchmarks and verify deliverability/compliance claims per jurisdiction; add suppression-list test cases. | P1 |
| `competitor-profiling` | 420-line workflow; templates/tool reference; restricted policy | Strong | Add source freshness and evidence confidence rubric to prevent inferred positioning from reading as fact. | P2 |
| `content-strategy` | 439-line workflow; distribution/CMS references | Adequate | Add measurable decision gates, content decay review, and worked prioritization example. | P1 |
| `cro` | 187-line framework; experiments/form references | Adequate | Add power/guardrail checks and a realistic low-traffic experiment decision path. | P1 |
| `customer-research` | 305-line workflow; source/interview references | Strong | Add sampling-bias and consent/redaction examples to synthesis. | P2 |
| `product-marketing` | 260-line context document workflow; restricted policy | Adequate | Add evidence provenance, conflicting-input resolution, and review cadence for stale claims. | P1 |
| `prospecting` | 267-line workflow; six branch/compliance references; restricted policy | Adequate | Add source terms, retention limits, dedupe QA, and jurisdiction-specific legal review trigger. | P1 |
| `ai-seo` | 493-line entrypoint; eight platform/format references; restricted policy | Adequate | Version/date platform assertions and separate observed behavior from speculative ranking factors. | P1 |
| `schema` | 179-line workflow; schema examples | Adequate | Add eligibility vs syntax distinction and official rich-result revalidation examples. | P1 |
| `seo-audit` | 499-line audit; international/AI-writing references | Adequate | Add dated search-engine rule references and sample crawl/coverage reconciliation. | P1 |
| `site-architecture` | 357-line workflow; three template/navigation references | Adequate | Treat three-click guidance as a heuristic; add task-based tree testing and migration/redirect verification. | P1 |
| `a11y-audit` | 14-line entrypoint; no focused references | Weak | Add WCAG-mapped keyboard, focus, semantics, name/role/value, screen-reader and manual-test workflow with evidence format. | P0 |
| `animate` | 207-line workflow; recipes reference | Strong | Add reduced-motion test fixtures and interruption examples for touch/keyboard inputs. | P2 |
| `apple-design` | 290-line interaction guidance | Adequate | Split platform-specific claims into references and add browser/assistive-tech verification cases. | P1 |
| `data-dashboard` | 16-line entrypoint; no references | Weak | Add metric-grain/source validation, chart choice, accessibility, latency and refresh-failure procedures. | P0 |
| `design-component` | 12-line entrypoint; no references | Weak | Add state matrix, composition/API criteria, keyboard behavior, responsive examples and regression checks. | P0 |
| `design-critique` | 14-line entrypoint; no references | Weak | Add evidence-based severity rubric, task-flow review, concrete before/after examples and verification. | P0 |
| `design-qa` | 14-line entrypoint; no references | Weak | Add breakpoint/state coverage, visual diff triage, interaction/accessibility checks and signoff evidence. | P0 |
| `design-reference-search` | 19-line entrypoint; eight local CSV catalogs; SHA-pinned Python search script | Adequate | Document catalog age/license, deterministic query examples, script input bounds and relevance evaluation. | P1 |
| `design-tokens` | 14-line entrypoint; no references | Weak | Add semantic token taxonomy, alias migration, contrast/theme examples and generated-artifact validation. | P0 |
| `emil-design-eng` | 674-line single entrypoint | Adequate | Preserve expertise while moving topic detail into focused references; add evidence vs taste rubric. | P1 |
| `figma-deliverables` | 81-line deliverable checklist | Adequate | Add token/component handoff examples, ownership, and implementation parity checks. | P1 |
| `frontend-design` | 71-line entrypoint; bundled license | Adequate | Add explicit responsive, accessibility and performance acceptance criteria beyond visual direction. | P1 |
| `improve-animations` | 114-line entrypoint; audit/plan templates; restricted read-only policy | Strong | Add severity calibration examples and links from findings to reproducible reduced-motion tests. | P2 |
| `mobile-native` | 311-line symptom/fix workflow | Strong | Add device/browser version matrix and form/input regression cases. | P2 |
| `pick-ui-library` | 85-line static vendor list | Adequate | Pin review date, license/maintenance checks, bundle/accessibility comparison and update cadence. | P1 |
| `prototype` | 105-line entrypoint; picker/journey references; restricted policy | Strong | Add representative journey test evidence and performance/accessibility checks for promoted versions. | P2 |
| `react-composition` | 12-line entrypoint; no references | Weak | Add component-boundary decision tree, state ownership and server/client examples with regression tests. | P0 |
| `react-performance` | 12-line entrypoint; no references | Weak | Add profiling-first workflow, React version checks, cache/hydration cases and before/after budgets. | P0 |
| `review-animations` | 120-line entrypoint; standards reference | Strong | Add reproducible measurement fixtures and examples distinguishing functional defects from taste. | P2 |
| `postgres-query-review` | 19-line baseline entrypoint; restricted policy; no references | Weak | Added plan-analysis and change-planning references with safe EXPLAIN and rollback criteria on this branch. | P0 |
| `security-code-review` | 19-line baseline entrypoint; restricted policy; no references | Weak | Added threat-path workflow, findings standard and non-invasive verification on this branch. | P0 |
| `typescript-safety` | 16-line baseline entrypoint; no references | Weak | Added boundary-validation and type-design references with runtime validation examples on this branch. | P0 |

## Cross-cutting findings

- The eight short design/React entrypoints need behavior examples and focused references; a valid `SKILL.md` does not establish useful decisions. These remain intact and are a separate P0 remediation backlog.
- The prior three engineering adaptations had safe scope but insufficient domain depth. This branch expands them in place, retaining their names and routing.
- Dynamic platform, product, and legal claims in marketing/SEO/library-selection skills need dated citations and refresh checks. Their present content is retained pending focused review.
- `design-reference-search/scripts/search.py` is the sole repository executable inside a skill. Its approved SHA-256 is recorded in `registry/executables.tsv`; adding or changing an executable fails the new quality gate until reviewed.

## Audit method and limits

Evidence includes full local source inspection, reference inventory, entrypoint length/section review, script inventory, registry/policy reconciliation, and static validation. Ratings are editorial engineering assessments. The non-engineering skills were not exercised with independent live agents or all external services, so claims of measured behavioral reliability would be unsupported. Remediation proposals are explicit; this change does not rewrite those skills.
