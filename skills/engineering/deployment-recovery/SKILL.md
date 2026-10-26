---
name: deployment-recovery
description: Plan and review application deployment, progressive rollout, health gates, rollback, and forward recovery for an existing environment. Use for release safety; not automatic production deployment.
---

### Local policy (agent-skills)

> Prepare release plans and isolated rehearsals. Live deployment, rollback, traffic shifting, database migration, and environment changes require explicit approval through the project's release process.

# Deployment and recovery

Identify actual deployment pattern (VM, container platform, serverless, mobile, static site), release artifact, environment topology, stateful dependencies and owner. Read [rollout design](references/rollout-design.md) and [rollback and recovery](references/rollback-and-recovery.md).

1. Define release preconditions: artifact digest, test evidence, compatibility window, migration status, observability, on-call owner and rollback candidate.
2. Choose a strategy matching failure tolerance and platform: rolling, canary, blue-green or atomic switch. Define traffic steps, health signals, soak time, stop thresholds and manual hold points.
3. Rehearse in staging with a realistic failure fixture. Check both deployment success and business transaction behavior; a healthy process can still serve incorrect results.
4. Prepare rollback and forward-fix separately. Verify schema/data compatibility and external side effects before promising reversibility.
5. During an authorized release, record actual revision, metrics, decision times and anomalies. Afterward, verify user journey and error budget, then close or escalate.

Do not hardcode Kubernetes commands for a non-Kubernetes project. This skill produces an approved runbook, not authority to execute it.
