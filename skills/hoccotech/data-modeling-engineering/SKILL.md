---
name: data-modeling-engineering
description: Design domain data models, relational schemas, and pipelines for management systems, with keys, constraints, history, and multi-tenancy. Use for new entities, booking or inventory models, reporting layers, and import/ETL design; for PostgreSQL migration safety also use postgres-schema-migrations.
---

# Data modeling and engineering

Read [modeling rules](references/modeling-rules.md) and [pipelines](references/pipelines.md). Inspect the existing schema, ORM, and data volume first; extend conventions rather than replacing them. Use `postgres-schema-migrations` for lock/backfill/rollback review and `postgres-query-review` for performance.

1. Start from the entities, states, and invariants found in `product-domain-discovery`; confirm identifiers and ownership (tenant, location, user).
2. Choose keys, constraints, and enums so invalid states are unrepresentable: foreign keys, unique and exclusion constraints (for example no overlapping bookings), checks, not-null.
3. Model money as integer minor units with currency, time as UTC timestamps plus the local zone where it matters, and status changes as history (event or audit rows) when the business needs it.
4. Plan soft delete, retention, PII separation, and tenant isolation (row-level policies or scoped queries) deliberately.
5. For analytics, keep an operational model separate from a reporting layer (views or marts); make pipelines idempotent, ordered, observable, and replayable.
6. Verify on a disposable local database with representative data: constraints reject bad rows, migrations are additive, and key queries use indexes.

Never touch production data or run destructive migration commands; deliver the schema, migration plan, and test evidence.
