---
name: ci-cd-engineering
description: Design or review continuous integration and delivery pipelines, release gates, artifact provenance, and deployment promotion. Use for pipeline engineering rather than application test design or autonomous release execution.
---

### Local policy (agent-skills)

> Treat pull request code as untrusted. Keep workflow tokens least-privileged; deployment and release publishing require project authorization and environment gates.

# CI/CD engineering

Inspect the repository's actual build, test, artifact, branch and environment policies. Read [pipeline design](references/pipeline-design.md) and [supply-chain and release](references/supply-chain-and-release.md). Do not assume GitHub Actions, Kubernetes or a cloud provider unless present.

1. Map change types to checks that catch meaningful failures: syntax/static, unit/integration, security, compatibility and representative behavior. State required versus advisory gates and their failure owner.
2. Define trust boundaries between untrusted PR code, protected branch, secrets, deploy credentials and artifact registry. Use minimal token permissions and pinned dependencies/actions where the platform supports them.
3. Build once when possible, identify artifacts by immutable digest, and promote the same artifact through environments. Keep release approval and rollback controls explicit.
4. Test the pipeline with a safe failing fixture and successful fixture; verify a failed required check blocks promotion and a fork PR cannot obtain deploy secrets.
5. Record runner/tool versions, permissions, cache keys, artifact retention, required checks and incident rollback path. Report checks that are unavailable or only desk-reviewed.

`test-master` chooses software behavior tests; this skill engineers their reliable execution and release gate. No workflow grants itself permission to deploy.
