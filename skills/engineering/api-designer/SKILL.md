---
name: api-designer
description: Design or revise HTTP API contracts with explicit resource semantics, authorization, errors, pagination, and compatibility. Use for REST or OpenAPI contract work and API evolution; not for UI-only implementation or internal function signatures.
---

# API designer

Inspect current consumers, authentication, data model, latency needs, API style, and versioning policy. Read [contract design](references/contract-design.md) for operations and examples; read [evolution](references/evolution.md) for compatibility and release planning. Keep GraphQL work aligned with an existing GraphQL schema rather than forcing REST conventions on it.

1. Define the resource, caller goal, allowed state transitions, and authorization boundary. Name resources consistently and use HTTP semantics intentionally; action endpoints can be justified for domain operations that are not CRUD.
2. Specify request/response schemas, required versus optional fields, null behavior, status codes, error shape, pagination, idempotency, and rate/size limits that apply to the use case.
3. Model negative paths: invalid input, unauthenticated and forbidden callers, missing resources, conflicts, stale versions, and partial downstream failure. Do not leak internal details through errors.
4. Write a contract example and validate it with the project's existing OpenAPI or schema tooling. Do not install or launch a mock server automatically.
5. Compare against existing consumers and tests. Classify additive versus breaking changes, document migration and sunset where needed, then verify happy and failure paths with contract tests.

For HTTP problem details, use RFC 9457 where appropriate; it obsoletes RFC 7807. Do not change an established compatible error format merely for stylistic consistency. Deliver a contract, decision rationale, compatibility notes, and verification evidence.
