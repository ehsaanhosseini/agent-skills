---
name: postgres-query-review
description: Diagnose PostgreSQL query plans and propose measured SQL, index, or statistics changes. Use for slow queries, planner estimates, JSONB access, and migration review; not for general SQL syntax help or autonomous database administration.
---

### Local policy (agent-skills)

> Review plans and proposals first. Database connections, changes, maintenance, extensions, replication, and production operations follow the current task authorization and the project's change controls. Do not use real customer data for exploratory tests.

# PostgreSQL query review

Read [plan analysis](references/plan-analysis.md) when diagnosing SQL and [change planning](references/change-planning.md) when a query, index, or configuration change is proposed. Establish server version, schema, cardinality, indexes, representative parameters, data skew, latency distribution, and whether the environment contains sensitive data.

1. Capture the baseline SQL, a plain `EXPLAIN` plan, and available `pg_stat_statements` or application timings. Redact literals and identifiers as needed. Do not infer production performance from a tiny test table.
2. Separate planner-estimate errors from actual work: row estimate versus observed rows, join order, sort/spill, buffers, and total latency. A sequential scan on a small or low-selectivity table can be correct.
3. Compare the smallest plausible alternatives: predicate or join rewrite, query shape, statistics, or an index aligned to the predicate and ordering. Estimate disk, write amplification, lock behavior, and migration cost.
4. Use `EXPLAIN (ANALYZE, BUFFERS)` only on an authorized safe environment with a controlled statement and workload. It executes the statement. For mutations, prefer a rollbackable test transaction only after assessing triggers and nontransactional side effects.
5. Verify before and after under comparable parameters and warm/cold cache conditions. Include both latency and plan evidence; report when representative data is unavailable.

Prepare production DDL or maintenance as a reviewable plan with rollback, monitoring, and acceptance thresholds. `CREATE INDEX CONCURRENTLY` cannot run inside a transaction block and can leave an invalid index on failure. Do not perform DDL, `VACUUM FULL`, extension changes, replication steps, or destructive recovery based on a reference example. Report exact version-dependent assumptions.
