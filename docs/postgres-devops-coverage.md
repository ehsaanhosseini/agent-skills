# PostgreSQL and DevOps specialist coverage

Source baseline: `Jeffallan/claude-skills` at `504bb9a067c5c7ea6bf868c7cc337164b213fa57`, already inventoried in `docs/jeffallan-file-inventory.tsv`. The original `postgres-query-review` remains scoped to plans, indexes and measured SQL changes. The broad `devops-engineer` prompt remains unimported; its useful topics are implemented as separately triggered, locally authored adaptations. No upstream operational command or executable is shipped.

| Domain | Skill | Boundary and verification |
|---|---|---|
| MVCC, isolation, locking, deadlocks | `postgres-concurrency` | Two-session disposable schedule; final invariant, SQLSTATE and retry behavior; read-only lock graph before action. |
| Query planning, statistics, indexing | `postgres-query-review` | Plain plan first; representative benchmark only in authorized environment; index/write/lock cost. |
| Schema, constraints, migration | `postgres-schema-migrations` | Expand/backfill/validate/contract; old/new app and interrupted backfill fixture; DDL separately approved. |
| WAL, replication, HA, backup, PITR | `postgres-reliability` | Base-backup/WAL-chain assessment and isolated marker-based restore drill; no live promotion/deletion. |
| Pooling, monitoring, capacity | `postgres-capacity` | Connection budget, telemetry freshness, pool/queue failure fixture and guarded rollout. |
| CI/CD and release gates | `ci-cd-engineering` | Fork PR cannot access secrets; failed required check blocks promotion; same artifact digest promoted. |
| Docker/container | `container-engineering` | Final image inspection, synthetic config, startup/termination and dependency failure. |
| Infrastructure as Code | `infrastructure-code-review` | Replacement/drift/state and sensitive plan review; no apply/destroy in review. |
| Deployment/rollback | `deployment-recovery` | Staged traffic, user-journey signal, backward-compatible rollback or forward-fix rehearsal. |
| Environment config/secrets | `configuration-secrets` | Missing/malformed/expired synthetic values and rotation overlap; never collect values. |
| Incident/recovery runbooks | `incident-runbooks` | Hypothesis-driven tabletop with misleading signal, preserved evidence and user/data recovery checks. |

## Technical source policy

PostgreSQL examples reference the official [MVCC](https://www.postgresql.org/docs/current/mvcc-intro.html), [transaction isolation](https://www.postgresql.org/docs/current/transaction-iso.html), [explicit locking](https://www.postgresql.org/docs/current/explicit-locking.html), [WAL](https://www.postgresql.org/docs/current/wal-configuration.html), [PITR](https://www.postgresql.org/docs/current/continuous-archiving.html) and [monitoring](https://www.postgresql.org/docs/current/monitoring.html) documentation. `/current/` links are pointers; every real engagement must switch to the installed major-version docs. Examples are fixture patterns, not instructions to run on production.

DevOps examples reference official [GitHub Actions security](https://docs.github.com/en/actions/reference/security/secure-use), [Docker builds](https://docs.docker.com/build/building/best-practices/), [Terraform plan/state](https://developer.hashicorp.com/terraform/cli/commands/plan), [Kubernetes rollout](https://kubernetes.io/docs/tasks/run-application/update-deployment-rolling/) and [NIST incident response](https://csrc.nist.gov/pubs/sp/800/61/r3/final). The skill first detects the project's actual platform. No Kubernetes, Terraform, GitHub Actions or cloud command is assumed to exist.

The split is intentional: a single generic `postgres-pro` or `devops-engineer` trigger would route too many unrelated and privileged tasks through one context. Specialist boundaries keep read-only review and mutating execution distinct. Cross-domain tasks can load more than one skill deliberately, for example a PostgreSQL migration during a deployment or database failover during an incident.
