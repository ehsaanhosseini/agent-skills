---
name: architecture-designer
description: Design or review a software system boundary when requirements, scale, failure behavior, data ownership, and deployment tradeoffs need an explicit decision. Use for architecture proposals and ADRs; not for routine implementation details or diagram-only requests.
---

# Architecture designer

Read [decision method](references/decision-method.md) for options and ADRs and [failure and verification](references/failure-and-verification.md) for operational qualities. Inspect the current system, constraints, team capabilities, expected load, data sensitivity, and change budget. Separate facts from estimates.

1. Define the decision and measurable quality attributes: latency, availability, recovery, consistency, cost, operability, and security as relevant. Record expected load with units and uncertainty.
2. Draw the current and proposed boundaries, data flows, trust boundaries, and ownership. Identify what can fail independently and how a request or event recovers.
3. Compare at least two viable options, including keeping the current architecture. Use decision criteria weighted by the actual project; do not choose microservices, event streams, or a database by team size alone.
4. Walk through normal traffic, peak load, partial outage, data migration, deployment, and rollback. Estimate capacity from assumptions; validate with measurements or a proof of concept when the decision is costly.
5. Write an ADR with context, decision, alternatives, consequences, unresolved risks, and a verification plan. Do not treat a diagram as an executable or approved deployment plan.

Prefer reversible boundaries and explicit ownership. Flag legal, privacy, and operational requirements that need specialist review. Implementation and production changes follow the project's own controls.
