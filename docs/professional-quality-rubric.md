# Professional skill quality rubric

This rubric is a human review gate. `scripts/quality_check.py` verifies metadata, links, protected IDs and executable hashes; it cannot prove engineering quality. Score each dimension 0–3 using the complete entrypoint and references: **0 absent/unsafe**, **1 asserted without a usable method**, **2 actionable with an example and verification**, **3 handles alternatives, failure modes and limits with evidence**. A production-ready skill needs at least 2 in every dimension, no unresolved safety defect, and a representative behavior scenario. Record reviewer, date, source version and evidence path.

| Dimension | Evidence needed for score 2 or 3 |
|---|---|
| Scope and routing | Trigger states when to use and when not; neighboring skills have distinct jobs; agent selects the intended entrypoint in a representative task. |
| Technical correctness | Version-aware claims cite authoritative sources where facts change; examples obey product semantics; assumptions are labeled. |
| Decision quality | Workflow gathers inputs, compares viable options, names tradeoffs and identifies stop conditions rather than prescribing one pattern. |
| Practical depth | Focused references contain realistic examples, edge cases, failure diagnosis and recovery, not repeated entrypoint prose. |
| Verification | Observable acceptance criteria, controlled fixtures, commands or procedures, baseline/comparison where relevant, and reporting of unavailable checks. |
| Security and authority | Trust boundaries, sensitive data, side effects, least privilege and production approval gates are explicit; no self-granted permission. |
| Maintainability and portability | Source/provenance/license, owner, freshness triggers, stable links, portable Agent Skills frontmatter and no unnecessary agent-specific tooling. |

## Review protocol

1. Read all source and local reference files; map claims to official documentation at the target version. Inspect scripts, hooks, permissions, dependencies and data flows.
2. Compare against existing skill IDs to prevent duplicate routing. Preserve current names unless a reviewed migration explicitly handles consumers.
3. Run structural/security checks, a negative control for unsafe requests, and at least one behavior fixture. Distinguish fixture contract checks from actual agent runs and manually inspect the latter against the rubric.
4. Record score/evidence and unresolved risk in the PR. A green CI result is necessary for merge to `dev` but cannot upgrade a 0/1 quality score to production-ready.
5. Recheck when the upstream version, official product semantics, supported agents or production environment changes materially.

The eight P0 remediations and ten PostgreSQL/DevOps specialists each have a focused entrypoint, two routed references, decision rules, realistic failure examples and acceptance procedures. Their source-quality review is documented in `docs/remediation-review.md`; executed agent results and limits are in `docs/evaluation-results.md`.
