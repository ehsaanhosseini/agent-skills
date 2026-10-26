# Evidence to requirements

Start with a specific question: for example, what happens when an invoice is canceled after payment? Trace the route or job, authorization check, state transition, database write, emitted event, and client response. Inspect tests and any migration history that explains legacy fields.

Record each rule with an identifier, source, confidence, and example:

> **OBS-INV-014 (observed):** When a paid invoice receives a cancel request from its owner, the service returns `409` and leaves status unchanged. Evidence: route handler and integration test at the reviewed commit.

If the code allows a refund path but no test exercises it, mark it inferred until verified. If a stakeholder expects cancellation to issue a refund, record that as a proposed rule and a contradiction, not as current behavior. EARS syntax can make rules testable, but the underlying evidence matters more than the template.

Look for boundaries and failure behavior: missing identity, wrong tenant, duplicate request, stale version, timeout after a write, retry after crash, partial external failure, and feature-flag changes. Avoid deriving business intent from function names alone. Keep private customer data and credentials out of the document.
