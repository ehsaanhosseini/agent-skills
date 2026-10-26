# Schema contracts

Start from entities, keys, relationship cardinality, ownership and business invariants. A `NOT NULL`, `UNIQUE`, foreign key or `CHECK` constraint can protect all writers, including background jobs, but only if its semantics match the domain. Document timezones, numeric precision, collation, deletion behavior and multi-tenant key boundaries. Avoid using a nullable unique column to imply a uniqueness rule you have not tested.

Example: orders have `(tenant_id, external_id)` unique per tenant. Use an appropriate composite uniqueness rule, then test two concurrent inserts with the same pair; one must fail or follow an explicit upsert policy. A global unique `external_id` would reject valid cross-tenant rows. Keep tenant ID in foreign-key relationships where cross-tenant references could otherwise slip through.

Choose JSONB for genuinely variable attributes with a query/index plan, not as a replacement for core relational constraints. A constraint or index change can alter write latency and replica replay; assess load and compatibility. Schema ownership includes application contracts, ETL consumers and retention policy. Review the installed version's [data definition documentation](https://www.postgresql.org/docs/current/ddl.html) before relying on new syntax or lock behavior.
