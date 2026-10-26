# Adding a skill or tool (vetting process)

Public shared skills library. `registry/skills.tsv` and `scripts/validate.sh` are the source of truth. Keep private project context and customer data outside this repository.
See also `SECURITY.md` (threat model) and `UPSTREAM.md` (provenance table).
For the current engineering depth rubric and reproducible checks, see [quality gates](quality-gates.md) and [behavior evaluations](engineering-behavior-evaluations.md).
New and substantially revised skills must also meet the [professional quality rubric](professional-quality-rubric.md), include a regression scenario in `evals/scenarios/`, and follow [engineering governance](engineering-governance.md).

## Flow

1. **Audit** the candidate (see Mandatory review rules).
2. **Security Review** against the 12-question checklist.
3. **Relevance / Overlap** against the existing registry (`scripts/inventory.sh`).
4. **Curate**: select only the skills that pass; do not import whole repositories.
5. **Pin SHA**: record the exact reviewed commit.
6. **Vendor** via `scripts/upstream.sh` (review-gated, feature branch only).
7. **Provenance**: LICENSE, PROVENANCE, `registry/skills.tsv` row, regenerate the `UPSTREAM.md` table.
8. **Policy** if required: `registry/policies/<skill>.md`, injected by the vendoring process.
9. **Link** with `scripts/link.sh`.
10. **Validate**: `python3 scripts/quality_check.py` and `scripts/validate.sh --strict --online` must PASS with 0 warnings. Record a behavior scenario for engineering changes.
11. **Feature Branch**: never work on main.
12. **Review**, then **Merge**.

## Cross-agent compatibility

Every new skill needs a portable `SKILL.md` with `name` and a task-specific `description`. Keep instructions usable in Claude Code, Codex, and Cursor Agent through the shared symlink layout. Agent-specific frontmatter or tool names may be added only when the other agents still have a clear, functional path. Do not treat a tool allowlist, invocation flag, or example command as a grant of permission. Verify the three discovery paths and relative links before merging. Locally authored adaptations of upstream skills must record the pinned source commit and must not use the verbatim upstream update command.

## Mandatory review rules

### a) Static review of SKILL.md alone is insufficient
The review must also cover:
- scripts, hooks and binaries shipped or fetched by the candidate;
- runtime-generated agent context: run the tool's context/prompt-emitting commands in a sandbox and inspect the output;
- lifecycle/install scripts and the full dependency tree;
- network behavior;
- filesystem writes: MEASURE the real footprint in a sandbox; do not trust the documentation;
- user-level config changes (agent, editor and shell configuration).

### b) Unsigned executable plus unavoidable network = gate fail
An unsigned or unattested executable combined with unavoidable outbound network communication is a GATE FAIL by
default. Only a specifically reviewed, documented exception can override it.

### c) Instruction-hierarchy overrides are an automatic reject
Any instruction that overrides or discounts the agent's system/session instructions, or grants itself permission to
spawn subagents or act without asking, is an automatic reject.

`scripts/validate.sh` enforces this with a pattern check over all vendored markdown:
- Findings are always fatal, with or without `--strict`.
- The scan is multi-line aware: each file is normalized (whitespace collapsed, blockquote and list markers stripped)
  before matching, so wrapped phrases are caught. Matches are reported as `file:line` of where they start.
- The only exemption is `registry/override-allowlist.tsv` (`skill`, `exact_line`, `justification`): the full source
  line, whitespace-normalized, must equal the entry. Substring matching is not used and a multi-line finding is never
  exempted. All three columns are mandatory, and an entry that matches no current line is a failure, so upstream
  edits force a re-review.
- Limitation: this is a regex tripwire, not a guarantee. Paraphrased or non-English override text can evade it, so
  human review of every vendored change remains mandatory.

### d) Pinning and side effects
- Exact version or SHA pinning; no `@latest`.
- No automatic global install.
- No automatic git changes.
- No external upload of artifacts.

### e) 12-question checklist (all must be answered in the review record)
1. Is it already available (an existing skill or tool covers it)?
2. Is it a material improvement over what we have?
3. Does it overlap with an existing skill?
4. What code is executed?
5. What context is injected into the agent?
6. What network requests are made?
7. What locations are written to?
8. Does it modify any repository?
9. Is it pinnable (exact version/SHA)?
10. Is provenance verifiable (signed/attested, reproducible)?
11. Are telemetry and network access controllable?
12. Is there a confidentiality or AI-trace risk?

### f) Rejected / deferred registry
| Candidate | Status | Reason / condition |
|---|---|---|
| Impeccable | REJECTED | Instruction-hierarchy override, unattested binary, unavoidable network call. Re-evaluation requires removal of the override behavior, verifiable provenance, controllable network, and a new full review. |
| Taste | DEFERRED | Needs its own full evaluation before any decision. |
| Awesome DESIGN.md | Reference only | Not vendored. |
| img2threejs | Not needed | No use case. |
| Playwright CLI | Pilot approved, staged | Policy staged in `registry/policies/playwright-cli.md`; not vendored or installed. |

## The `.agents/` rule (application repos)
Files generated by skills into application repos (for example `.agents/product-marketing.md`) are LOCAL-ONLY BY
DEFAULT. Exclude them per repository via `.git/info/exclude`. Tracking one requires an explicit per-project decision.
Do not create a global gitignore rule for this.
