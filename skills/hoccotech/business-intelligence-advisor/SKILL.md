---
name: business-intelligence-advisor
description: Turn business data into decisions: questions, metrics, diagnostics, and recommendations with stated uncertainty. Use for revenue, occupancy, utilization, churn, or performance questions in a PMS, marketplace, clinic, salon, or studio; not for dashboard visuals or SQL tuning.
---

# Business intelligence advisor

Read [decision framing](references/decision-framing.md) before analysis and [sector questions](references/sector-questions.md) for the domain. Reuse `kpi-analytics-engineering` for metric definitions and `data-dashboard` for presentation.

1. Restate the decision, who makes it, and what would change their mind. If none, reframe the question.
2. Check data sources, freshness, grain, and known gaps. State what the data cannot show.
3. Decompose the outcome (for example revenue = volume x price x mix) and compare against a baseline: prior period, same season, segment, or target.
4. Test explanations against the data; separate correlation from cause and flag small samples.
5. Recommend 1-3 actions with expected impact, cost, risk, and the metric that will confirm success. Label confidence.

Never present invented numbers; say "not measurable with current data" and name what to collect. Keep personal and patient data aggregated or de-identified in outputs.
