---
name: postgres-query-review
description: Diagnose PostgreSQL query plans and propose query or index changes when a measured database performance issue is in scope. Use for slow SQL, planner estimates, index choice, JSONB access, and migration review; not for general SQL syntax help.
---

### Local policy (agent-skills)

> Review plans and proposals first. Database connections, changes, maintenance, extensions, replication, and production operations follow the current task authorization and the project's change controls. Do not use real customer data for exploratory tests.

# PostgreSQL query review

Establish the PostgreSQL version, schema, row counts, query parameters, workload, and current measurements. Redact sensitive values from plans and reports.

1. Start with existing query text, statistics, and a plain `EXPLAIN` plan. Compare estimated rows, actual observations already available, I/O, sort or join cost, and existing indexes.
2. Use `EXPLAIN (ANALYZE, BUFFERS)` only in an authorized safe environment after checking whether the statement mutates data, triggers side effects, takes locks, or creates unacceptable load. `ANALYZE` executes the statement.
3. Propose the smallest query, index, or statistics change supported by the evidence. Account for write overhead, disk, locks, migration rollback, and version-specific behavior. A sequential scan is not automatically a defect.
4. Test the candidate against representative data and compare plans and latency under similar conditions. State uncertainty when production-scale verification is unavailable.

For production changes, prepare a reviewable migration and rollout plan. Execute DDL, maintenance, extension, replication, or configuration changes only with task authorization and the project's change controls. Never run destructive recovery commands from an upstream example. Do not assume `CREATE INDEX CONCURRENTLY` works inside a transaction or that one index type fits every JSONB query.
