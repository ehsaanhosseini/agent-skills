# Architecture decision method

Define one decision at a time. Example: an order workflow needs durable writes, an inventory reservation, and email notification. Options could include a synchronous modular monolith, a database transaction plus outbox for asynchronous email, or separate services with event delivery. Compare consistency needs, latency, retry semantics, team ownership, deployment complexity, and recovery. Splitting services does not by itself improve reliability.

An ADR should contain:

1. **Context:** current architecture, load, constraints, and evidence sources.
2. **Decision drivers:** measurable requirements and hard constraints.
3. **Options:** at least two feasible approaches, including status quo when viable.
4. **Decision:** chosen approach and why its tradeoffs fit the drivers.
5. **Consequences:** costs, new failure modes, operational ownership, migrations, and reversible steps.
6. **Verification:** load, failover, security, and data-integrity checks with acceptance thresholds.

For the order example, a transactional outbox avoids an order commit succeeding while its event is lost, but consumers must still be idempotent because delivery can repeat. If an inventory reservation spans services, define timeout, compensation, and customer-visible state. An architecture diagram should label data ownership and sync versus async links; do not draw an unlabeled arrow and assume consistency semantics are obvious.
