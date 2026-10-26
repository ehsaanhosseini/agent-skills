# Remediation source review

Review date: 2026-10-26. Reviewer: repository change author. The seven dimensions in `professional-quality-rubric.md` were checked for each complete entrypoint and its two references. Every row reached **2 or higher** on scope, correctness, decisions, depth, verification, safety and maintainability in this source review. This is a documented editorial assessment, not an independent agent pass. Agent-run cases and remaining limits are recorded separately.

| Skill | Technical decision and realistic failure evidence | Verification evidence |
|---|---|---|
| `a11y-audit` | Keyboard/AT/visual matrix, focus behind modal and unannounced error, verified vs untested criterion. | Reproduce by viewport/input/AT; recheck focus, error association and adjacent states. |
| `data-dashboard` | Metric grain and source contract; late, missing and restricted occupancy data; chart/table reconciliation. | Fixed fixture with zero/full occupancy, restricted property, timeout and timezone boundary. |
| `design-component` | Search field anatomy, controlled value and async response ordering; native vs custom combobox decision. | State matrix, keyboard/AT, translated content and host-app regression. |
| `design-critique` | Observation vs hypothesis; stale status below fold; severity by task impact. | Matched before/after task and viewport, untested behavior explicitly routed. |
| `design-qa` | Risk-based matrix; unexplained visual diff and clipped modal at zoom. | Controlled data/fonts/clock, keyboard/focus and diff triage. |
| `design-tokens` | Primitive vs semantic role, brand/status separation, alias/mode failures. | Deterministic generation, cycle/mode checks, rendered contrast and rollback. |
| `react-composition` | Mutually exclusive Notice variants, invalid old callers, controlled state and focus. | Type/behavior/host tests, migration inventory and compatibility path. |
| `react-performance` | Profiling list typing before memo/split, state ownership, bundle/latency tradeoff. | Matched production-build measurements, failure and accessibility regressions. |
| `postgres-concurrency` | MVCC snapshots, deadlock lock order, bounded transaction retry and blocker diagnosis. | Disposable two-session invariant and SQLSTATE fixture. |
| `postgres-schema-migrations` | Constraint semantics, DDL locks, phased backfill and old/new app compatibility. | Interrupted backfill, replica lag, rollback and data-integrity rehearsal. |
| `postgres-reliability` | WAL retention, failover fencing, incomplete archive and backup≠standby. | Isolated base-backup/PITR marker drill with RPO/RTO measurement. |
| `postgres-capacity` | Pool budget, queue/idle connections, retained WAL vs table bloat. | Peak-like load in safe environment, telemetry window and guarded rollback. |
| `ci-cd-engineering` | Untrusted PR vs protected release, token scope, artifact digest. | Fork/failed-check negative fixtures and staging promotion proof. |
| `container-engineering` | Multi-stage build, secret mount, base refresh and runtime identity. | Image history/files, startup/termination and dependency-failure fixture. |
| `infrastructure-code-review` | Plan replacement/drift/state sensitivity; one-line diff blast radius. | Approved plan review, staged observation and recovery prerequisites. |
| `deployment-recovery` | Canary/rolling choice, schema compatibility and forward-fix option. | Staging failure injection, business journey and stop-threshold check. |
| `configuration-secrets` | Config schema and rotation overlap, leaked-state risks. | Synthetic missing/expired/rotated credential fixture. |
| `incident-runbooks` | Competing hypotheses, preserved evidence, bounded containment. | Tabletop with misleading signal and sustained user/data recovery. |

The references provide actionable procedures rather than claiming a specific deployment or database version. A future domain-owner review should challenge the source scores and run environment-specific drills before using any specialist as a production runbook.
