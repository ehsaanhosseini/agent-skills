# Modeling rules

- Bookings and reservations: store start/end as a half-open range; enforce non-overlap per resource with an exclusion constraint where supported.
- Inventory: ledger of movements plus derived balance; never negative without an explicit rule.
- Money: integer minor units, currency code, tax and fee lines separate; never float.
- Status: constrained set plus transition table or checks; keep status history with actor and time.
- Multi-tenant: tenant id on every owned table, composite unique keys include tenant, queries and policies scoped by tenant.
- Identity: surrogate primary key plus natural unique keys; external ids stored with source name.
- PII/health data: separate tables, minimal fields, encryption at rest per platform policy, access logged.
- Soft delete only when restore or legal retention needs it; otherwise archive.
