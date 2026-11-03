# Exception handling

- Every manual override requires role check, reason, and audit entry.
- Refunds and cancellations follow a written policy; compute amounts from rules, not free text.
- Retries: exponential backoff, dead-letter queue, operator-visible failures.
- Compensation: when a later step fails, define the undo or the manual follow-up.
- Reconciliation: periodic comparison of internal state to payment provider, channel manager, or external calendar; surface mismatches.
- Communication: customer-facing messages for delay, change, and cancellation are defined with the workflow.
