# Workflow design

- Transition table: From | Event | To | Allowed roles | Preconditions | Side effects | Audit fields.
- Examples: reservation hold -> confirmed on deposit; appointment scheduled -> checked-in -> completed; listing draft -> pending review -> published -> sold/expired; project brief -> approved -> in progress -> delivered -> invoiced.
- Concurrency: use optimistic version checks or locks to prevent double booking and double processing.
- Notifications: template, trigger, channel, quiet hours, opt-out, and failure retry.
- Staff views: today's arrivals/appointments, overdue items, items needing approval, exceptions queue.
