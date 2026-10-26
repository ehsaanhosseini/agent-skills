# Rollout design and gates

Map artifact → environment → traffic → data dependencies. A rolling update gradually replaces instances; a canary exposes a small population; blue-green changes the routing boundary. Each has costs and failure modes. For Kubernetes, review [Deployment rolling update guidance](https://kubernetes.io/docs/tasks/run-application/update-deployment-rolling/) against the installed cluster version; the pattern is not universal.

Example canary for a checkout service: deploy immutable image digest to a small traffic slice, verify success rate, latency, payment idempotency and order reconciliation against baseline, then increase traffic only after a defined observation window. A synthetic health endpoint alone is inadequate. Segment metrics by release version without putting user IDs in labels. Include a manual stop if instrumentation is missing.

Gate record: source commit, artifact digest, approver, environment, preflight checks, step sizes, signals/thresholds, hold duration, escalation and stop condition. Check capacity for double-running versions and compatibility of API/schema/event consumers. Avoid automatic promotion when the metric denominator is too small or telemetry is delayed.
