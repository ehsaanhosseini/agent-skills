---
name: postgres-capacity
description: Diagnose PostgreSQL connection pressure, pooling, resource saturation, vacuum/bloat symptoms, and capacity trends from read-only telemetry. Use for operational planning, not privileged live tuning or standalone SQL plan review.
---

### Local policy (agent-skills)

> Start with read-only telemetry and redacted samples. Production connection, pooler, memory, vacuum, restart, and maintenance changes require explicit authorization and rollout controls.

# PostgreSQL capacity

Determine server version, instance resources, workload mix, pooler mode, peak concurrency, growth and service SLO. Read [connections and pooling](references/connections-and-pooling.md) and [monitoring and capacity](references/monitoring-and-capacity.md).

1. Establish baseline CPU, memory, I/O, disk/WAL, active/idle connections, waiting clients, transaction age and query latency over representative peak periods.
2. Separate causes: pool exhaustion, too many server backends, lock waits, slow SQL, storage saturation, autovacuum lag, replication lag or telemetry gaps. Use `postgres-query-review` for plan-level work and `postgres-concurrency` for lock graphs.
3. Build a capacity model from arrival rate, service time, concurrency, connection budget, headroom and growth. State assumptions and uncertainty; do not tune from one instantaneous graph.
4. Propose the smallest safe experiment in an isolated or approved staging environment: pool sizing, workload shaping, query/index change, vacuum scheduling or resource change. Include cost and failure side effects.
5. Verify p95/p99 latency, error rate, queueing, disk growth and recovery under peak-like load, then plan guarded rollout and rollback. Never run load tests against production without explicit scope and limits.

Read-only views can expose SQL text or user identities; redact shared evidence and respect privileges.
