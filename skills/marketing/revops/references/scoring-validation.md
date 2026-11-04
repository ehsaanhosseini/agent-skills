# Scoring and routing validation

Adapted from Marketing Skills revops scoring-models and routing-rules at the supplemental SHA (MIT).

Define the qualification decision time, eligible population, outcome and maturation window. Separate account fit from behavioral intent. Only features available at decision time are eligible; later sales calls, closed-won status or later usage would leak the answer. Avoid universal point thresholds.

Freeze features, weights and threshold before evaluating a later fully matured holdout. Keep related contacts/accounts together where necessary to avoid account leakage. Do not tune on the holdout. Note outcome censoring and seasonal differences.

Compare TP/FP/FN/TN, precision TP/(TP+FP), recall TP/(TP+FN), missed wins, false positives and sales workload with the existing baseline. Zero denominators are undefined. Example: 30 wins among 50 routed leads gives precision 60%; if 40 eligible wins existed overall, recall is 75%. Higher precision can still be unacceptable if it misses valuable accounts or overloads capacity.

Routing precedence example: existing-account owner -> agreed territory/account rule -> qualified specialist queue -> owned fallback. Apply suppression/access constraints before outreach assignment. Define duplicates, owner absence, conflicting territories, stale records, unknown geography and manual overrides. Log rule version and assignment reason.

For a hotel group, route the account once under the agreed owner instead of independently routing every property contact. Replay the same event to test idempotency; retries must not create duplicate sales tasks. Pilot with monitoring, compare workload and accepted outcomes, and retain rollback. CRM/API writes and jobs require authorization.
