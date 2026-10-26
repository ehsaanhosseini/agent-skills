---
name: postgres-concurrency
description: Diagnose PostgreSQL transaction anomalies, lock waits, deadlocks, and contention using version-aware MVCC and isolation reasoning. Use for concurrency behavior, not standalone slow-query tuning or autonomous production operations.
---

### Local policy (agent-skills)

> Diagnose with read-only evidence first. Run concurrent write fixtures only in an authorized disposable database. Production lock termination, transaction changes, and configuration changes require the project's approval controls.

# PostgreSQL concurrency

Establish server major version, isolation level, transaction boundaries, pooler mode, retry behavior and the affected invariant. Read [MVCC and isolation](references/mvcc-and-isolation.md) and [locks and diagnosis](references/locks-and-diagnosis.md).

1. Reconstruct two or more concurrent transaction timelines and identify which statements read a snapshot, write rows, wait, abort or retry. Distinguish row locks from table locks and predicate conflicts.
2. Use read-only diagnostics (`pg_stat_activity`, `pg_locks`, application traces) with privileges and privacy limits. Do not assume a waiting session is a deadlock; identify blocker, wait event, age and the business action.
3. Choose among a database constraint, transaction isolation, consistent lock order, bounded retry, shorter transaction or workload change. Explain anomalies each option prevents and creates.
4. Reproduce in a disposable fixture with two sessions and controlled timing. Assert final invariant, expected SQLSTATE and retry idempotency; test timeout and partial failure.
5. Present a reviewed implementation and rollout/rollback plan. Do not cancel backends or change live lock settings as a diagnostic shortcut.

Use the installed major version's official PostgreSQL documentation. `postgres-query-review` handles plan/index tuning; this skill handles correctness and contention under concurrency.
