# Query and index change planning

Choose the smallest change that solves the measured bottleneck. An index candidate needs a matching query predicate, column order, selectivity, and evidence that the planner can use it. For JSONB, a GIN index over the document suits some containment operators; an expression B-tree index can be better for a frequently filtered scalar path. Operator class and query operator must match. Partial indexes help only when the query predicate implies the index predicate.

Before a production migration, document table size, expected build time and space, write rate, lock behavior, transaction framework, rollback, and monitoring. `CREATE INDEX CONCURRENTLY` reduces blocking but does more work, has restrictions, and can leave an invalid artifact after failure. A nonconcurrent build may be acceptable during an approved maintenance window on a small table. Avoid blanket rules.

Example review plan:

1. Baseline p50/p95 latency and rows scanned for representative parameter groups.
2. Test a candidate index on production-like data and compare `EXPLAIN (ANALYZE, BUFFERS)` in a safe environment.
3. Review added index size and write overhead; verify insert/update throughput is acceptable.
4. Execute under the project's migration approval process; watch lock waits, index validity, error rate, and latency.
5. Roll back by dropping the candidate index through an approved migration if the acceptance threshold fails.

Do not infer improved user experience from plan cost alone. Avoid `VACUUM FULL` as a routine tune-up; it rewrites and locks the table. Treat extension installation, replication slots, and configuration changes as separate operational projects with capacity and recovery plans.
