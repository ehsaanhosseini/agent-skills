# Pipeline design and failure semantics

Start with a matrix of event, trust level, checks, artifact and allowed side effects. PR validation should use untrusted code with read-only repository access and no production secrets. Protected-branch release can use narrowly scoped credentials after required checks and human/environment approval. Avoid `pull_request_target` with untrusted checkout unless a security review proves it safe.

Example for a skill library: every PR runs metadata/registry/provenance validation, shell/Python syntax, local-link resolution, secret/prompt-override scans and fixture-based quality-gate tests. The online check may run on a protected schedule or job with network, but a network failure must be reported and should not silently pass. A malformed `SKILL.md` should fail the PR job; a successful PR job alone does not authorize `main` promotion.

Design for reproducibility: specify runner image, tool versions, cache invalidation, timeout, log retention and skipped-test reporting. Matrix only over meaningful OS/agent differences; avoid combinatorial jobs without signal. Test a deliberately broken registry row in a disposable copy to prove the gate fails. Use [GitHub workflow permission guidance](https://docs.github.com/en/actions/reference/workflows-and-actions/workflow-syntax) when GitHub Actions is used.
