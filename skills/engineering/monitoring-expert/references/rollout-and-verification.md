# Instrumentation rollout

Map where requests enter, cross async boundaries, and finish. Propagate correlation context safely across services; do not inject sensitive baggage. Instrument error outcomes and latency at the boundary that represents user experience, then add dependency spans or logs only when they help diagnosis. Avoid duplicate counting when middleware and handlers both record the same request.

Verification matrix:

| Scenario | Expected evidence |
|---|---|
| Successful request | One eligible count, measured latency, correlated trace/log when sampled |
| Validation failure | Correct outcome classification; no secret payload in telemetry |
| Dependency timeout | Error count, dependency context, trace linkage, useful runbook path |
| Service restart | Counter semantics understood, scrape/export resumes |
| Telemetry backend outage | Application remains functional; bounded queue/drop policy |

Roll out to a test environment, validate cardinality and export volume, then enable progressively under project controls. Compare sampled telemetry to application logs or synthetic requests. Simulate alert firing with a test rule or isolated environment before paging real responders. Record ownership, retention, and estimated cost. A successful SDK initialization does not prove useful observability.
