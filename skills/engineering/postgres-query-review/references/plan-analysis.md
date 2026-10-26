# Plan analysis

Begin with query shape, table sizes, existing indexes, PostgreSQL version, representative bind values, and an ordinary `EXPLAIN (FORMAT JSON)` or text plan. `EXPLAIN` without `ANALYZE` describes the estimated plan; it does not measure runtime. `EXPLAIN ANALYZE` executes the query and adds actual timing and row counts. `BUFFERS` helps distinguish I/O from CPU work. Read plans from leaves upward, compare estimated and actual row counts, and look for repeated nested-loop work, expensive sort/hash spills, and filter versus index condition.

For example, a query filtering `orders` by `customer_id` and recent `created_at` may benefit from an index starting with `customer_id`, but only if selectivity and ordering justify its write and storage cost. Compare `EXPLAIN` for the actual predicate and ordering. Do not add an index solely because a sequential scan appears; on small tables or broad predicates it may be faster.

Check parameter sensitivity and skew. One tenant or status value can be much more common than another. A plan captured with a literal may differ from a prepared statement's generic plan. If estimates are badly wrong, inspect stale statistics and extended statistics before adding another index. Distinguish low latency on a warm local cache from production performance.

For authorized safe `SELECT` tests, record:

```sql
EXPLAIN (ANALYZE, BUFFERS, FORMAT JSON)
SELECT id, created_at FROM orders
WHERE customer_id = $1 AND created_at >= $2
ORDER BY created_at DESC LIMIT 50;
```

Supply representative parameters through the project's normal query tooling. Set a bounded statement timeout in the test session if needed. Never run an unknown mutating statement under `ANALYZE` just to see a plan. Report the plan node, estimate error, buffers, latency, environment, and confidence.
