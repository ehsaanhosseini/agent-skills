# Conversion verification matrix

Trace source truth -> eligible event -> consent -> transport -> destination acceptance -> reporting. Record redacted synthetic evidence for each hop; a request is not proof of reporting.

| Case | Expected outcome |
|---|---|
| Confirmed booking/order | One eligible stable-ID event with correct value/currency |
| Click/validation failure/abandonment/API failure | No completed conversion |
| Refresh/retry/webhook replay | Stable ID, no second counted outcome |
| Browser plus server | Compatible event name/ID and documented deduplication |
| Denied/changed consent | Approved policy respected before collection/transmission |
| Iframe/cross-domain | Supported handoff; origin, source and schema validated; spoof rejected |
| Partial refund/cancel | Supported reconciliation and net-revenue rules |
| SPA navigation | Count real success once, not on every render |
| Blocked browser destination | Document loss and lawful options; do not bypass user choice |

Prefer supported callbacks/server-confirmed records over brittle DOM text. Third-party cookies cannot be read across unrelated origins; use an authorized supported handoff if available, with consent and retention controls. PostMessage origin validation alone is insufficient without expected source and payload validation.

Server secrets stay server-side and out of logs. Hashing email is personal-data processing. Never send health conditions, appointment reasons or confidential client fields merely because a destination accepts uploads.

If reporting is delayed or receipt unobservable, mark the final hop unverified and specify the controlled follow-up. A recipe, simulated listener or staged plan is not an executed conversion test.
