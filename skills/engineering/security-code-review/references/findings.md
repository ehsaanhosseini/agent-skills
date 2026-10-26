# Findings and verification

Use one finding per root cause. Record:

| Field | Required evidence |
|---|---|
| Location | File and line in the reviewed commit; affected entry point |
| Preconditions | Who can reach the path and what input/state is needed |
| Boundary | The missing validation, authorization, or isolation check |
| Impact | Data or capability exposed, with uncertainty stated |
| Confidence | Confirmed by code/test, or hypothesis needing verification |
| Fix | Smallest corrective change and migration considerations |
| Verification | Negative and positive regression cases; scanner result if relevant |

Example: a route reads `invoice_id` from a signed-in user's request and calls `findInvoice(invoice_id)` without checking account ownership. Before classifying it as confirmed, inspect `findInvoice` and any row-level policy. A useful regression test creates invoices for two accounts and confirms that account A receives a denial for B's ID while retaining access to its own invoice. Do not include real IDs or invoice contents in a public report.

Severity considers exposure, reachability, required privileges, impact, and compensating controls. Use CVSS only when enough environmental facts support a defensible vector. Group scanner noise and unverified concerns separately. Re-run relevant tests after remediation and say which review surfaces remain untested.
