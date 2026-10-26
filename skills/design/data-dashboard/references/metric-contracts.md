# Metric contracts and reconciliation

For each metric, record source, event or row grain, population filter, numerator, denominator, aggregation, unit, timezone, late-arrival policy, freshness, owner, and action. If conversion is `orders / sessions`, specify whether one user may have many sessions, whether canceled orders count, and whether numerator and denominator share the same filters. Do not join order rows to session rows and count duplicates as new orders.

Example fixture: 100 eligible orders on Monday, 3 canceled, 2 refunded. A “completed orders” card defined as noncanceled/nonrefunded is 95, not 100. The weekly chart and drill-down table must use the same predicate. If two orders arrive after the refresh cutoff, label the displayed figure with its `as of` time; do not silently compare it with fully settled prior weeks.

Reconciliation checks:

1. Sum mutually exclusive chart segments to their declared whole, allowing documented rounding tolerance. A donut of statuses must not omit unknown status without a visible “other/unknown” segment.
2. Compare filtered table row count or aggregate to the summary card for the same time window and permissions. If aggregation grains differ, explain the discrepancy instead of forcing equality.
3. Test empty, missing, partial, stale, and permission-limited datasets separately. A missing metric is not zero.
4. Verify period boundaries in the product timezone and daylight-saving transitions; compare like with like before claiming growth.

If source freshness or grain cannot be established, mark the number provisional and keep it out of decision-critical alerts or rankings until validated.
