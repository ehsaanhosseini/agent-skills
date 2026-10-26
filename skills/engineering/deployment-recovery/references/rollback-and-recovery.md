# Rollback and forward recovery

An application binary may be reversible while its database or emitted events are not. Before release, classify migrations as backward-compatible, dual-write, irreversible or requiring a forward fix. Keep previous artifact and configuration available, but verify that reverting will not corrupt new writes or strand messages.

Failure fixture: after a release, checkout error rate rises while database migration has added a nullable column. If old code still understands rows written by new code, roll back the application artifact after approval and verify transactions. If new code has changed irreversible order status values, pausing traffic and forward-fixing may be safer. Do not execute either path without the incident/release owner.

Runbook should include exact revision identifiers, decision owner, stop threshold, safe commands supplied by the project's platform, verification query/user journey, communication plan and post-event reconciliation. Test rollback in staging, including a failed rollback, before relying on it. Record actual RTO and unresolved data cleanup; a green deployment status is not proof of user recovery.
