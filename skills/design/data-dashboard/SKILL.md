---
name: data-dashboard
description: Design or review operational dashboards and dense data screens where people need to interpret metrics, charts, tables, and next actions. Use for CMS, PMS, analytics, and monitoring views; not for marketing pages.
---

# Data dashboard

Start with the reader, their decision, the reporting period, and the source of each metric. If these are unknown, label assumptions and sample data. Choose the lead metric by decision value, then arrange context, diagnosis, and actions in that order. Give repeated cards different visual weight only when their importance differs.

For every metric, define numerator, denominator, unit, comparison period, update cadence, and the action it supports. Show freshness and uncertainty when they affect interpretation. Keep counts reconcilable across summary cards, charts, and tables. A donut represents parts of one whole and must total that whole. A line chart needs axes or an explicit period and scale; zero baselines matter for bars. Use chart types for their meaning, not variety alone.

Design the full journey below the first viewport: summary, trend/composition, operational exceptions, prioritized findings, detail table, and recent activity where the brief supports them. Avoid inventing sections to fill space. Give each action a destination. Keep filters, sort state, empty/error/loading states, permissions, and drill-down behavior coherent. On narrow screens, preserve decision order; let dense tables scroll or switch to a meaningful row summary rather than shrinking all columns.

Give each chart an accessible text summary and a tabular route to exact values when users need them. Do not use color alone to encode status. Inspect rendered desktop and mobile layouts, including labels inside donuts, legends, tooltips, and button text. Use `design-critique` for judgment and `design-qa` for measured checks when those tasks are in scope.

This is an adaptation of the dashboard decision and chart-integrity methods in XIAS `data-dashboard` at commit `62092bd83bc3df0bcb9a2b3b643305ab11c547da`; it does not depend on the XIAS kit, scripts, or Claude-specific paths.
