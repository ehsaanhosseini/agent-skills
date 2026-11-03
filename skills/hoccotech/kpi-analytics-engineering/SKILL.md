---
name: kpi-analytics-engineering
description: Define, compute, and validate business KPIs and event tracking with a clear grain, owner, and test. Use when metrics disagree, a KPI tree or tracking plan is needed, or analytics events and reports are being built; not for marketing-site analytics (see analytics).
---

# Data analytics and KPI engineering

Read [metric specs](references/metric-specs.md) for the definition template and [validation](references/validation.md) before shipping a number. For web marketing measurement use `analytics`; for visuals use `data-dashboard`.

1. Start from the decision a metric supports. Build a short KPI tree: one outcome, its drivers, and guardrail metrics.
2. Write each metric spec: name, business meaning, formula, grain, filters, time zone and calendar, source of truth, owner, refresh, known caveats.
3. Define events or source tables with stable ids, timestamps, actor, and idempotent ingestion. Avoid personal data unless required and permitted.
4. Compute in one governed place (SQL view, model, or service), not per dashboard. Handle late data, refunds/cancellations, currency, and time zones explicitly.
5. Validate: reconcile to a source total, test edge cases, compare to a manual sample, and add an automated check where the project has tooling.

Deliver the spec, query or model, validation evidence, and open caveats. Do not publish a KPI without a reconciliation result or an explicit "unvalidated" label.
