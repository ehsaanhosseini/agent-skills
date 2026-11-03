# Discovery method

- Inputs to check first: README, schema, existing routes, support tickets, spreadsheets the team really uses.
- Question budget: at most five questions per round, each tied to a decision it unblocks.
- Output template: Actors | Goals | Entities and states | Rules and invariants | Integrations | Compliance | Risks | First slice | Open questions.
- Rule format: "When <state/event>, the system must/must not <behavior>, because <business reason>". Mark each as confirmed or assumed.
- Prioritize by frequency x cost of error. A rare but irreversible action (refund, discharge, delete) gets an explicit rule and audit trail.
- Exit criteria: a stakeholder can read the first slice and say what ships, what does not, and how success is measured.
