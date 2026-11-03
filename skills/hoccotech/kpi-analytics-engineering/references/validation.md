# Validation

- Reconcile totals to the system of record (ledger, payment provider, PMS folio) for at least one closed period.
- Check: duplicates, nulls, orphan keys, timezone boundaries, daylight-saving days, cancelled/refunded rows, test data leakage.
- Idempotency: replaying the same events must not change results.
- Backfills: record version and date of metric definition changes; do not silently restate history.
- Privacy: no raw personal or health data in analytics tables when an aggregate or hashed id suffices.
- Report: query, row counts, reconciliation delta, tests run, remaining caveats.
