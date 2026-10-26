---
name: postgres-reliability
description: Review PostgreSQL WAL, replication, high availability, backup, point-in-time recovery, and failover plans with measurable recovery evidence. Use for resilience design and runbooks, not autonomous production failover or restore.
---

### Local policy (agent-skills)

> Read-only review and isolated restore drills are the default. Production backup configuration, promotion, failover, restore, timeline changes, and data deletion require explicit authorization and an approved runbook.

# PostgreSQL reliability

Establish server major version, managed/self-hosted topology, RPO/RTO, data volume, WAL/archive location, retention, encryption, replica roles and ownership. Read [WAL and replication](references/wal-and-replication.md) and [backup and recovery](references/backup-and-recovery.md).

1. Draw primary, standbys, archive and application routing. Distinguish crash recovery, streaming replication, backup and disaster recovery; a standby is not a backup.
2. Trace WAL generation, archiving and retention. Inspect replication lag, slot retention, archive failures and disk headroom through read-only metrics; identify whether monitoring itself is incomplete.
3. Define failure scenarios: primary loss, region loss, accidental delete, corrupt backup, delayed standby and split brain. State the recovery path and expected data loss for each.
4. Rehearse restore and PITR in an isolated environment using a non-sensitive backup or approved secure copy. Verify application consistency and measured recovery time; do not infer recoverability from backup-job success.
5. Deliver a version-specific runbook with prerequisites, decision owner, stop conditions, fencing/routing, validation and post-event reconciliation. Production failover remains an explicitly authorized operation.

Do not copy upstream destructive recovery commands. Never remove a data directory or promote a standby merely to test guidance.
