# RBAC and auditability

- Model roles, permissions, and scope (tenant, location, owned records); deny by default; check on the server at the data-access layer, not only in UI or middleware.
- Test matrix: each role x action x resource, including cross-tenant and ID-guessing (IDOR) attempts.
- Sensitive flows (refund, export, role change, health or financial records) need explicit permission, step-up auth where appropriate, and an audit entry.
- Audit log: actor, action, target, before/after summary, time, source, request id; append-only, access-controlled, no secrets or full personal data; retention per policy.
- Break-glass access: time-limited, reason required, reviewed afterward.
- Admin and support impersonation is logged and visibly marked.
- Report gaps with the affected role, resource, and a concrete fix.
