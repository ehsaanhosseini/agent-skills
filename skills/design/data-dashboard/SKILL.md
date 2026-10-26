---
name: data-dashboard
description: Design or review operational dashboards and dense data screens where people need to interpret metrics, charts, tables, and next actions. Use for CMS, PMS, analytics, and monitoring views; not for marketing pages.
---

# Data dashboard

Identify the audience, decision, time horizon, data owner and refresh promise before drawing cards. Read [metric contracts](references/metric-contracts.md) for grain and reconciliation, then [interaction and verification](references/interaction-and-verification.md) for charts, states and acceptance checks. Use sample data only when clearly labeled.

1. Define each metric's grain, numerator, denominator, units, inclusion/exclusion rules, timezone, update cadence and source query. Reconcile card, chart and table totals against the same filtered population.
2. Rank information by decision value: status, change, cause, exception and action. Choose a chart only when it improves comparison or diagnosis; a table may be better for exact values.
3. Design filtering, comparison periods, drill-down, permissions and actions as one state model. Show freshness and data-quality warnings; distinguish zero, missing, delayed and unauthorized data.
4. Check chart semantics: axes, units, baselines, totals, color meaning and accessible alternatives. Keep dense data usable on narrow screens without hiding the most important decision.
5. Verify with a fixed dataset containing normal, boundary and failure cases. Inspect rendered desktop/mobile states, keyboard order, tooltips and the reconciliation assertions in the references.

Use `design-critique` for qualitative judgment and `design-qa` for measurable UI checks when in scope. This expands the existing XIAS dashboard adaptation without importing its kit or scripts.
