# Signals and alert design

For a request service, define an SLI as successful eligible requests divided by eligible requests, with explicit exclusions and aggregation window. Define latency as a distribution (for example p95 for successful requests) and count traffic/errors. Decide whether retries are counted at client or server boundary. A metric name without numerator, denominator, and units is not an operational contract.

Use counters for cumulative events, gauges for current values, histograms for distributions, and traces for causal paths across components. Keep labels bounded (route template, status class, region) rather than raw paths or user identifiers. Logs need structured fields such as request ID, operation, status, and error category; redact tokens, passwords, and personal data before export.

Example alert decision: page when a service burns its error budget quickly enough that users are currently affected and an on-call engineer has a runbook. A single 500 response may warrant investigation but not a page. Test the rule against historical incidents and quiet periods. Include dashboard link, owner, impact, initial checks, and safe rollback path in the runbook.

Do not infer SLO attainment from a graph with missing telemetry or a changed denominator. Report ingestion gaps, sampling, and label-cardinality limits.
