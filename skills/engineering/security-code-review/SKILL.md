---
name: security-code-review
description: Review application code for concrete security defects with evidence, impact, and actionable fixes. Use for scoped source review of authentication, authorization, input handling, secret exposure, and dependency risk; active testing requires separately defined scope.
---

### Local policy (agent-skills)

> Source review is the default. Active testing needs an authorized target, scope, and rules of engagement. Keep credentials and sensitive findings out of public artifacts; do not run scanners that upload source or findings unless the task authorizes that transfer.

# Security code review

Define the code and environment in scope. Trace trust boundaries and high-impact paths before choosing tools. Review authentication and authorization checks, untrusted input, data exposure, secrets, and relevant dependencies.

- Prefer repository-provided, read-only scanners. Inspect their scope and data handling before use; do not install or run networked scanners automatically.
- Confirm each finding in code or a safe test. Include a file and line, the triggering condition, impact, confidence, and the smallest practical remediation. Distinguish confirmed defects from suspected risks.
- Redact credentials, personal data, and exploit payloads in reports. If a live secret is found, report its location and coordinate rotation through the owner's process.
- Active probing, penetration testing, production access, or changes to security controls require explicit scope and authorization. Stop before a test could disrupt service or access data beyond scope.

Report the checks performed and their limits. A clean scanner result is not proof that the code is secure.
