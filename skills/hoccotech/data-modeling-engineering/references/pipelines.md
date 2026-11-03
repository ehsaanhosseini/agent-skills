# Pipelines

- Extract with a watermark or change id; load idempotently (upsert on natural key).
- Stage raw data unchanged, transform into typed models, then publish marts. Keep lineage notes.
- Imports from spreadsheets: validate, quarantine bad rows with reasons, produce a dry-run report before applying.
- Quality checks: row counts, uniqueness, referential integrity, freshness, value ranges. Alert on failure; do not silently drop rows.
- Backfills run in batches, are resumable, and are tested on a copy first.
- Document schedule, owner, failure behavior, and replay procedure.
