---
name: postgres-schema-migrations
description: Design and review PostgreSQL schemas, constraints, and migration plans with lock, backfill, compatibility, and rollback analysis. Use for DDL and data-shape evolution, not routine query tuning or automatic production changes.
---

### Local policy (agent-skills)

> Prepare and rehearse migrations in disposable or approved staging environments. Never run production DDL, backfills, or destructive cleanup without explicit authorization and the project's change controls.

# PostgreSQL schema and migrations

Read [schema contracts](references/schema-contracts.md) and [migration safety](references/migration-safety.md). Establish PostgreSQL major version, table size/write rate, dependent queries, replication topology, maintenance window and rollback capability.

1. Define invariants in database constraints where feasible: types, nullability, uniqueness, foreign keys and check constraints. Clarify ownership, lifecycle and data retention.
2. Classify each change by compatibility, rewrite/scan cost, lock level and duration, WAL growth, replica lag and application deployment order. Check exact version behavior, not a generic “online migration” recipe.
3. Plan expand → backfill → validate → contract when old and new application versions coexist. Make backfills bounded, resumable and observable; keep destructive cleanup separate.
4. Rehearse against representative volume and concurrent traffic. Capture lock waits, duration, disk/WAL, query plans and failure recovery.
5. Deliver ordered steps, preconditions, stop thresholds, rollback or forward-fix path, and verification SQL/tests. Production execution is a separate authorized action.

For pure query/index diagnosis, use `postgres-query-review`; this skill owns schema invariants and migration lifecycle.
