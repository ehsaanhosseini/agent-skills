> **Local policy (agent-skills repo, applies before everything below):**
> - Staged policy: Playwright CLI is not installed or vendored. This file applies if and when a playwright skill is added.
> - Exact pinned versions only; never `@latest`.
> - No automatic package install and no automatic global install.
> - No automatic git changes and no modification of tracked files.
> - No automatic PR upload and no external artifact upload; evidence stays local unless explicitly approved.
> - Role: verification layer. Order: build, typecheck, tests, Playwright desktop/mobile/interaction/console verification, raw evidence, PASS/FAIL.
> These restrictions never grant autonomous external actions; anything beyond them needs explicit user approval in the current task.
