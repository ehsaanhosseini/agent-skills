---
name: monitoring-expert
description: Design or improve application observability when service-level indicators, logs, metrics, traces, and actionable alerts need evidence. Use for production telemetry and alert reviews; not for visual dashboard styling or ad hoc performance guesses.
---

### Local policy (agent-skills)

> Instrumentation and alert changes for live services follow project review and rollout controls. Avoid exporting secrets, personal data, or high-cardinality identifiers.

# Monitoring expert

Read [signals and alerts](references/signals-and-alerts.md) to choose metrics and paging thresholds; read [rollout and verification](references/rollout-and-verification.md) for instrumentation and operations. Inspect the service's user journeys, existing telemetry, incident history, privacy constraints, backend, and on-call ownership.

1. Name the decision the signal supports: detect user harm, diagnose a bottleneck, or plan capacity. Start with a small number of service-level indicators such as success rate and latency distribution.
2. Choose metric, log, or trace based on that purpose. Define units, labels, sampling, retention, and cardinality budget. Do not put user IDs, URLs with secrets, or free-form error strings in metric labels.
3. Define alert condition, evaluation window, severity, owner, and runbook. Prefer symptom-based paging over alerts for every internal fluctuation.
4. Add or revise instrumentation with a bounded rollout. Verify emitted data in a safe environment, then compare dashboards with known request samples and error cases.
5. Test an alert trigger and recovery path without disrupting production. Record false-positive risks, missing coverage, and operating cost.

Do not assume a dashboard or trace exporter is already configured. Use installed client versions and OpenTelemetry semantic conventions that match the project's dependencies. Load or stress tests require an authorized target and limits.
