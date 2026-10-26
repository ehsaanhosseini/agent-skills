# Failure modes and verification

For each critical path, ask what happens if a dependency is slow, unavailable, or returns a partial result. Identify timeout budgets, retries with backoff and jitter, idempotency, bounded queues, circuit breakers where useful, and user-visible recovery. Retrying a non-idempotent write can duplicate it; retries can also amplify an outage.

Record recovery point and time objectives only if the business has established them. A multi-region diagram does not prove failover works. Check data residency, encryption, identity boundaries, secrets, observability, on-call ownership, and cost of the proposed topology.

Practical verification matrix for a new architecture:

| Claim | Evidence |
|---|---|
| Meets latency target | Load test with realistic request mix and p95/p99, not only average |
| Survives dependency outage | Controlled fault test in an authorized environment with recovery observation |
| No lost/duplicate business action | Idempotency and replay tests plus reconciliation procedure |
| Safe rollout | Migration rehearsal, rollback condition, compatibility window |
| Operable | Dashboard, alert owner, runbook, and observed recovery time |

Use estimates when measurement is unavailable and label them clearly. Avoid presenting a benchmark from a laptop as production capacity.
