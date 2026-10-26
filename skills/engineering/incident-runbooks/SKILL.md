---
name: incident-runbooks
description: Draft or review production incident diagnosis, containment, recovery, communications, and post-incident runbooks. Use for operational response planning or an authorized incident; not autonomous live containment.
---

### Local policy (agent-skills)

> Preserve evidence and follow incident command. Production containment, failover, credential rotation, customer communication, and recovery actions require explicit authorization from the responsible operator.

# Incident runbooks

Identify service, severity model, incident commander, affected users, telemetry and existing escalation paths. Read [diagnosis and command](references/diagnosis-and-command.md) and [recovery and learning](references/recovery-and-learning.md). In a live incident, distinguish observed facts from hypotheses and keep a timestamped decision log.

1. Establish impact, start time, affected journeys and immediate safety constraints. Assign command, communications and technical investigation roles per the organization's process.
2. Gather read-only signals first: symptoms, recent changes, dependency health, error budget and known-good baseline. Avoid deleting logs or restarting systems before preserving useful evidence.
3. Develop competing hypotheses and discriminating checks. Choose containment with reversible scope and an explicit stop condition; avoid broad changes from a single correlation.
4. Verify recovery through user journeys, data integrity, queue/backlog drain and sustained metrics, not merely service restart. Escalate when recovery is incomplete or unsafe.
5. Record timeline, actions, decisions, remaining risk and follow-up owners. Test the runbook in a tabletop or isolated failure drill and revise gaps.

`deployment-recovery` handles release rollback; `postgres-reliability` handles database restore/failover detail. This skill coordinates operational response and evidence.
