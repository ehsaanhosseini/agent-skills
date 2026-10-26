# Diagnosis, command and containment

Use an incident record with UTC and local timestamps, severity, impact, commander, communications owner, hypotheses, evidence and decisions. Define what “contained” means for users and data. A read-only first pass may include dashboards, logs, traces, deploy history and dependency status; redact customer data and preserve access controls.

Example: checkout failures rise after a release. Compare failure rate by version, region and payment dependency; inspect whether old version still fails. If only new version fails and schema compatibility is known, propose a bounded rollback to the release owner. If both fail, rollback may waste time; test payment dependency and data-store health. Do not announce “root cause” from timing alone.

Containment choices such as traffic shift, feature disable, credential revocation or database failover have side effects. State expected benefit, blast radius, decision owner, execution steps from the approved platform runbook, observation window and stop/revert condition. NIST [SP 800-61 Rev. 3](https://csrc.nist.gov/pubs/sp/800/61/r3/final) provides incident-management context; the organization's own policy decides authority.
