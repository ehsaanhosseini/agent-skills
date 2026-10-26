# Compatibility and error evolution

Inventory actual consumers, generated clients, and documented behavior before changing a field. Removing a field, changing its type or meaning, narrowing accepted values, or changing error status can break clients. Adding an optional response field is usually safer but may still affect strict parsers. Use consumer contracts or telemetry where available; do not assume no clients exist because the repository lacks them.

For a breaking change, choose a migration path: additive replacement field, dual read/write period, explicit version boundary, and a documented sunset. Set an owner, dates, and rollback condition. Versioning may be URL, header, media type, or schema evolution; follow the service's existing convention unless there is a strong reason to change it.

RFC 9457 `application/problem+json` provides `type`, `title`, `status`, `detail`, and `instance` members, with extension members for machine-readable data. The HTTP status remains authoritative to generic clients. Do not expose stack traces, SQL, account existence, or private identifiers in `detail`. An existing domain error format can remain preferable when migration cost is high.

Decision record: list old and proposed contracts, affected operations, consumer evidence, auth/privacy impact, migration stages, tests, and rollback. Check both success and failures. Preserve documented semantics even if a new template looks cleaner.
