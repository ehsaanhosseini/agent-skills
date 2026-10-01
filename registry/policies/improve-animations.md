> **Local policy (agent-skills repo, applies before everything below):**
> - Do not modify project source code, configs or dependencies. Write plan files only if the user authorized plan output for this task and only under `plans/` (upstream convention); otherwise present the plan in chat.
> - `execute <plan>` (changing code, worktrees, subagents that edit) requires explicit task authorization.
> These restrictions never grant autonomous external actions; anything beyond them needs explicit user approval in the current task.

