# Dashboard interaction and verification

Use the smallest visual form that serves the question: line for time trend with explicit period, bar for category comparison with an honest baseline, table for exact values, and composition chart only for parts of a common whole. Avoid dual axes without a strong reason. If values are uncertain, show intervals or explanatory text; do not imply spurious precision.

Define one filter state shared by cards, charts and detail. Every drill-down should preserve or visibly restate the date range, entity and comparison. Sorting must not change the underlying numerator. Keep restricted rows inaccessible at the data boundary, not merely hidden in the UI. On mobile, preserve status → cause → action order; let inherently two-dimensional tables scroll with clear headers rather than shrinking text below usable size.

Acceptance fixture for an occupancy dashboard: include 0 occupied rooms, full occupancy, one room with missing state, late updates, a timezone boundary, restricted property, and an API timeout. Verify occupancy denominator excludes out-of-service rooms only if contract says so; card and trend agree at the selected timestamp; missing state is labeled; restricted property is absent from every query; timeout shows stale-data notice and retry rather than a fabricated zero. Give chart summary and table route to exact values. Test keyboard access to filters and data points.

Report the fixture, source-query or API version, assertions, viewport sizes and untested states. A visually attractive dashboard with unreconciled measures fails review.
