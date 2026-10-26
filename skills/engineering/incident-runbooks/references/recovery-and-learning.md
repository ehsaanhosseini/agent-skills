# Recovery verification and learning

Recovery requires more than a green health check. Verify the affected user journey, error/latency signals, queue drain, data reconciliation, secondary regions and customer-visible side effects over a defined observation window. If a credential was rotated, verify old access is revoked and new access works. If failover occurred, verify routing and data lag before reopening writes.

Runbook drill: simulate an unavailable downstream service in an isolated environment. Require the operator to identify impact, preserve logs, distinguish downstream failure from deploy regression, choose bounded containment, verify recovery, and record the decision timeline. Inject one misleading signal to test whether the runbook encourages confirmation rather than premature root-cause claims.

Post-incident record: factual timeline, contributing conditions, detection gap, decision rationale, user impact, recovery evidence, follow-up action with owner/date and a drill to verify the fix. Avoid blame and unsupported certainty. Mark unresolved data-integrity work as open even if availability has returned. Keep sensitive logs in approved systems, not a public repository.
