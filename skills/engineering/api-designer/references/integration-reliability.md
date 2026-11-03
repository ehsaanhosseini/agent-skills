# Integration reliability

For third-party and cross-service calls (payment, channel manager, messaging, maps, webhooks).

- Timeouts on every call; bounded retries with exponential backoff and jitter, only for idempotent or keyed operations.
- Idempotency keys for create/charge/booking operations; store the result for replay.
- Webhooks: verify signature, accept fast and process async, dedupe by event id, tolerate out-of-order delivery, expose a replay path.
- Circuit breaker or degraded mode when a provider is down; queue and reconcile later.
- Rate limits: respect provider quotas, back off on 429, cap concurrency.
- Reconciliation job comparing local state with the provider; alert on drift.
- Contract tests with recorded or sandbox fixtures; never call live providers with real customer data in tests.
- Secrets in config, rotated, scoped to least privilege; log request ids, not payloads containing personal data.
