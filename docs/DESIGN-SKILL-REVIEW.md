# Design skill integration review

Reviewed source snapshots: Anthropic `dbd4588f9e1033efb41dad4bef2f7947c8993d44`, XIAS `62092bd83bc3df0bcb9a2b3b643305ab11c547da`, Pro Max `7246805992a42b7bba37d4cac83b01416f0c6c44`, Vercel `063bee94c3f4df8453406c830b0a7df0f2860278`, and AccessLint `2e9d7336678302d0bc08848e92542560295b34d3`. Source licenses and provenance for copied content are in `upstream/`. The comparative audit preceded integration; this record describes what is actually in this branch.

| Required question | Answer for this integration |
|---|---|
| 1. Already available? | Existing eight design skills were retained. New names cover gaps in art direction, dashboards, critique, accessibility, QA, tokens, components, and React code. |
| 2. Material improvement? | The Figma dashboard pilot supported the dashboard/critique/token direction. Real-product gate and code performance gains remain unverified until a runnable project is tested. |
| 3. Overlap? | `prototype` receives one optional journey reference; no replacement. Token/brand guidance stays in one new token skill. QA and critique have different scopes. |
| 4. Executed code? | Only `design-reference-search/scripts/search.py` is shipped as executable logic; it reads local CSVs with the Python standard library and writes JSON to stdout. Other new skills are Markdown. |
| 5. Agent context? | Each new `SKILL.md` is task-scoped; no always-on instruction, agent definition, or hook is installed. Supporting CSVs are read only on a search request. |
| 6. Network? | No new skill makes network calls by itself. Source links are for provenance; the Pro Max search is offline. |
| 7. Filesystem writes? | The search script writes nothing. Future design/build tasks may edit the user-selected project under ordinary task authorization. |
| 8. Repository modifications? | This branch adds skills, registry records, provenance, and docs. No app repo or agent config is changed; no symlinks are created by this PR. |
| 9. Pinning? | Copied Anthropic instructions and Pro Max CSVs are tied to exact commits. Other adaptations cite exact reviewed commits and are maintained as local skills. |
| 10. Provenance? | Git commit IDs and source paths are recorded; copied license files retained. Source signatures/attestation were not independently verified. |
| 11. Telemetry/control? | None shipped. No remote SDK, CDN gate, updater, install command, or external telemetry is included. |
| 12. Confidentiality/AI trace? | No customer data, private screenshots, credentials, prompts, or generated product assets are included. Catalog queries remain local. |

## Acceptance boundaries

- `scripts/validate.sh --repo-only` and the skill frontmatter validator check package and registry integrity. The offline search must return a relevant chart row and an empty result for an unrelated query; it must not persist files.
- The XIAS browser gates were **not** transplanted or claimed as passed. A project can adopt pinned local Playwright/axe checks through `design-qa` after its own browser run.
- Figma-only work can support visual review but cannot verify focus, keyboard, screen-reader behavior, live data, or code performance.
- The existing repository policy requires private GitHub visibility for `--online` validation. Visibility must be reconciled separately before activation if the connected GitHub repository remains public.
