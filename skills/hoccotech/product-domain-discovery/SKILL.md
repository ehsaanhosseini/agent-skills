---
name: product-domain-discovery
description: Turn a vague business-system idea into domain rules, actors, workflows, and a scoped first release. Use before building or extending a PMS, marketplace, clinic, salon, studio, or other management system; not for pure UI or code-level tasks.
---

# Product and domain discovery

Start from the project's own repo, docs, and data before asking questions; ask only what the evidence cannot answer. Read [domain patterns](references/domain-patterns.md) for the sector and [discovery method](references/discovery-method.md) for outputs.

1. Name the business, actors, and the decision or money each workflow moves. Separate observed facts from assumptions.
2. List core entities, lifecycle states, and the rules that must never be violated (double booking, unpaid release, consent, stock below zero).
3. Map the current workflow and its failure paths before proposing software. Mark what is manual, what is regulated, and what is integrated.
4. Slice a first release around one end-to-end workflow with measurable success; defer the rest explicitly.
5. Deliver actors, glossary, entity/state list, rules, risks, open questions, and the first slice. Hand off to `data-modeling-engineering`, `business-workflow-operations`, or `kpi-analytics-engineering` as needed.

Keep customer data, credentials, and private business terms out of shared files; record them in the project's own repo.
