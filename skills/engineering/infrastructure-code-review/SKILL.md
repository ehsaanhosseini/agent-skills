---
name: infrastructure-code-review
description: Review Infrastructure-as-Code changes for plan effects, state, security, drift, dependency, and recovery risk. Use for Terraform/OpenTofu or other IaC reviews; not autonomous apply or resource destruction.
---

### Local policy (agent-skills)

> Treat state and plans as sensitive. Use read-only review by default; planning may contact providers and needs an authorized workspace. Apply, import, state surgery, and destroy require explicit approval.

# Infrastructure code review

Identify tool/provider versions, backend, workspace, environment, ownership and existing drift. Read [plan review](references/plan-review.md) and [state and safety](references/state-and-safety.md). Do not assume Terraform commands apply to another IaC tool.

1. Review source changes and module boundaries, then obtain an authorized plan. Categorize creates, updates, replacements, deletes and unknown-at-plan-time values. Investigate unexpected drift before approving any change.
2. Assess blast radius: networking, identity, encryption, data stores, quotas, downtime, dependency ordering and cost. A small text diff can cause a destructive replacement.
3. Check state/backend access, locking, secret exposure, provider pinning and environment separation. Never paste raw plans or state into public review if they may contain secrets.
4. Define staged rollout, explicit approval, post-apply verification and recovery. A speculative plan can become stale; compare the final plan at apply time.
5. Report precise risk, affected resources, evidence, unresolved unknowns and what would block or permit approval. Do not run `apply`, `destroy` or state mutations from a skill example.

`deployment-recovery` owns application rollout decisions; this skill owns infrastructure intent and state safety.
