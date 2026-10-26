# Engineering skills vetting — 2026-10-26

> Historical record of the first six-candidate, three-skill integration on PR #6. The subsequent full 12-candidate review, 34-skill baseline audit, and revised decisions are in [Jeffallan candidate assessment](jeffallan-candidate-assessment.md) and [existing skills audit](existing-skills-audit.md). Decisions below describe that earlier change, not the current library.

Decision: add three locally authored, cross-agent adaptations. Source snapshot: [Jeffallan/claude-skills at `504bb9a`](https://github.com/Jeffallan/claude-skills/tree/504bb9a067c5c7ea6bf868c7cc337164b213fa57). The commit has a verified GitHub signature; the root license is MIT. The source paths and exclusions are recorded in `upstream/jeffallan-claude-skills/PROVENANCE`.

## Existing library audit

All 31 registered skills were inventoried against their `SKILL.md` entrypoints, categories, statuses, and links. No existing skill or registry row is removed or edited by this change. The design group remains `emil-design-eng`, `apple-design`, `animate`, `review-animations`, `improve-animations`, `prototype`, `pick-ui-library`, `mobile-native`, `frontend-design`, `data-dashboard`, `design-critique`, `a11y-audit`, `design-qa`, `design-tokens`, `design-component`, `react-performance`, `react-composition`, `design-reference-search`, and `figma-deliverables`. Marketing remains `product-marketing`, `content-strategy`, `customer-research`, `competitor-profiling`, `prospecting`, `cold-email`, `cro`, and `analytics`. Search remains `seo-audit`, `ai-seo`, `schema`, and `site-architecture`.

Overlap check: `react-performance` already covers React/Next performance, `react-composition` covers React component APIs, `design-qa` covers UI regressions, and `a11y-audit` covers accessibility. None covers TypeScript runtime boundaries, PostgreSQL plan safety, or application security source review. Existing restricted policies and manual-invocation flags are preserved.

## Upstream selection

The upstream catalog contains 67 skill entrypoints. The shortlist was inspected at its pinned commit; all six shortlisted `SKILL.md` files were read. For the three selected folders, every referenced Markdown file was reviewed. Their folders contain no scripts, binaries, hooks, manifests, or MCP configuration. No upstream executable or dependency is integrated.

| Upstream candidate | Decision | Reason |
|---|---|---|
| `typescript-pro` | Adapt as `typescript-safety` | Runtime validation and type boundaries add a distinct capability. Removed unconditional branded types, compiler flags, declarations, and tool installs. |
| `postgres-pro` | Adapt as `postgres-query-review` | Plan and index analysis add a distinct capability. Removed executable replication, extension, `VACUUM`, and DDL recipes. `EXPLAIN ANALYZE` executes a query and requires a safe authorized environment. |
| `security-reviewer` | Adapt as `security-code-review` | Evidence-based source findings add a distinct capability. Excluded penetration testing, credential harvesting, automatic scanners, and Claude-only `allowed-tools`. |
| `test-master` | Defer | Broad generic testing guidance overlaps normal engineering practice and `design-qa`; its references include additional third-party adaptations. Reconsider for a specific gap. |
| `debugging-wizard` | Defer | General reproduce–isolate–fix guidance adds little beyond normal debugging. |
| `nextjs-developer` | Reject for this integration | Overlaps `react-performance`; mandates App Router, per-segment files, and version-sensitive cache behavior irrespective of the project's Next.js version. |

Other upstream language, cloud, and framework specialties were screened by name for likely scope; no repository-specific need justified adding them now.

## Mandatory security and compatibility review

1. **Already available / improvement / overlap:** the three selected capabilities fill the gaps above; broad or duplicate candidates were deferred.
2. **Code and context:** selected source folders are Markdown only. Only three short, locally authored `SKILL.md` files enter agent context. No upstream prompt, hook, binary, or install step is copied.
3. **Network and writes:** the new skills make no automatic request or write. Suggested tools and database actions require the current task scope and project controls. No runtime fetch is required.
4. **Repository changes:** the integration changes only this feature branch. The skills do not grant themselves Git or deployment authority.
5. **Pin and provenance:** the exact upstream commit and source paths are in the registry and provenance record; the MIT license is retained. The upstream commit signature was verified by GitHub; this does not attest individual skill safety.
6. **Telemetry and confidentiality:** no telemetry code is included. The review instructions require redaction and guard against scanner uploads and sensitive data in public artifacts. There is no AI-trace or third-party upload step.
7. **Injection and permissions:** reviewed Markdown was treated as untrusted source material. Absolute upstream directives were rewritten for task scope. No instruction hierarchy override, autonomous approval, or agent-specific tool permission is imported.

Cross-agent contract: portable `SKILL.md` frontmatter uses `name` and `description`; runtime instructions use ordinary files and project-native commands. No new skill depends on Claude-only metadata, Codex-only tools, Cursor-only commands, or automatic installation. `scripts/link.sh` discovers all `skills/<category>/<name>/SKILL.md` paths, including engineering. Existing agent-specific invocation flags remain untouched.
