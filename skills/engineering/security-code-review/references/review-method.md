# Source review method

Map untrusted inputs, identity/session state, authorization decisions, storage, outbound calls, and data returned to callers. Select representative routes, jobs, and configuration paths rather than searching only for dangerous function names.

For an object-read endpoint, trace: route authentication → identifier parsing → object lookup → tenant/owner authorization → response serialization. If the lookup is `getById(id)` with no tenant constraint and the authorization check only tests that a user is logged in, the defect is an insecure direct object reference. Confirm whether service-layer or database policies enforce ownership before reporting it. The fix may be a tenant-scoped lookup plus a regression test for cross-tenant access.

Review common boundaries: SQL parameterization, command execution, filesystem path handling, HTML rendering, SSRF-capable HTTP clients, deserialization, access control, CSRF where applicable, secure cookies, logging, and secret storage. Framework defaults vary by version and deployment configuration; verify actual middleware and call sites.

For dependencies, distinguish a vulnerable package in the lockfile from a reachable vulnerable code path. Record package/version, advisory, runtime use, fix availability, and whether the patch changes behavior. Do not install a scanner or upload the repository merely because an upstream reference suggests it.

Where a test is authorized, use a local fixture and assert both allowed and denied cases. Avoid real credentials and production data. If the target or evidence is unavailable, state the limit rather than inventing exploitability.
