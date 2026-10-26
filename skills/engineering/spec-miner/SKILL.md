---
name: spec-miner
description: Reconstruct an evidence-backed behavioral specification from an existing, poorly documented codebase. Use for legacy system discovery, migration planning, and missing requirements; distinguish observed behavior from intended policy.
---

# Spec miner

Read [evidence to requirements](references/evidence-to-requirements.md) to extract behavior and [coverage and uncertainty](references/coverage-and-uncertainty.md) to verify completeness. Define the system boundary, consumers, entry points, and questions the specification must answer. Source code, comments, tests, logs, and stakeholder statements can disagree; record which source supports each claim.

1. Inventory routes, commands, jobs, data stores, schemas, feature flags, and external integrations. Follow representative flows from input to output or side effect.
2. Extract observable rules: preconditions, validation, state changes, errors, authorization, timing, retries, and invariants. Cite file/line or test evidence.
3. Mark each statement `observed`, `inferred`, or `proposed`. Code behavior is not automatically the desired requirement, especially around bugs and undocumented security behavior.
4. Use a consistent testable form (EARS when useful) and include examples and counterexamples. Record contradictions and open questions rather than resolving them by guesswork.
5. Verify with existing tests, a safe local run, or stakeholder review. Build a coverage map from entry points to documented rules and identify uninspected branches.

Do not run migrations, mutate production data, or expose secrets merely to inspect behavior. Deliver a specification with evidence links, confidence, gaps, and a prioritized validation plan.
