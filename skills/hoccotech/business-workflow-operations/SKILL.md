---
name: business-workflow-operations
description: Design and review business workflows such as bookings, approvals, billing, inventory, reminders, and handoffs as explicit state machines with roles, exceptions, and audit. Use for PMS, clinic, salon, studio, and marketplace operations; not for pure UI layout.
---

# Business operations and workflow

Read [workflow design](references/workflow-design.md) and [exception handling](references/exceptions.md). Pair with `product-domain-discovery` for rules, `security-code-review` for access and audit, and `data-modeling-engineering` for persistence.

1. Describe the workflow as states, events, actors, and allowed transitions; list who may perform each transition.
2. For every transition define preconditions, side effects (payment, notification, inventory), and the audit record.
3. Design exception paths first: cancellation, no-show, overbooking, refund, dispute, partial failure, manual override with reason.
4. Make operations idempotent and safe to retry; separate the decision (state change) from side effects handled via a queue or outbox.
5. Add reminders, SLAs, and escalation for items that stall; define the daily operational views staff need.
6. Test each transition and each forbidden transition; show evidence.

Deliver a state diagram or table, role matrix, exception list, notifications, and tests. Flag any step involving payments, medical data, or legal duties for human approval.
