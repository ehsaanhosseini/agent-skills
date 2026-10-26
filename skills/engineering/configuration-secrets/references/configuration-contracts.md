# Configuration contracts

Define each key's name, type, scope, default policy, validation, owner and restart/reload behavior. Example: `PAYMENT_TIMEOUT_MS` is an integer within a reviewed range, required in all environments, and logged only as a validated configuration version. `PAYMENT_API_TOKEN` is a runtime secret; a missing token should fail readiness or disable the feature safely rather than fall back to an insecure endpoint.

Keep development, staging and production values separate while preserving schema parity. A `.env.example` may contain names and safe placeholders, never real values. Detect drift in allowed keys or schema, not by dumping raw environment variables into CI logs. Public client bundles must not receive server credentials merely because a framework exposes environment prefixes.

Acceptance fixture: start with valid synthetic config, then missing required key, malformed URL, expired token and conflicting flags. Assert clear redacted diagnostics, safe failure and an operator recovery path. Record which values require restart and whether an old version can run with a new schema during rollback.
