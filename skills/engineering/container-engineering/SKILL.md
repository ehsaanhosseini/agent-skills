---
name: container-engineering
description: Design or review Docker/container build, image, runtime, and supply-chain behavior for an existing application. Use for container-specific correctness and security, not generic deployment orchestration.
---

### Local policy (agent-skills)

> Build only in an authorized local or CI environment. Do not publish images, expose credentials, or modify live container infrastructure without project authorization.

# Container engineering

Inspect runtime language/version, build context, package locks, target architecture, registry, orchestrator and threat model. Read [build and image](references/build-and-image.md) and [runtime verification](references/runtime-verification.md).

1. Minimize build context and separate build dependencies from runtime output. Choose a maintained base, pin immutable identity where reproducibility matters, and record update policy.
2. Keep credentials out of build args, environment layers, logs and final image. Use supported secret mounts for private dependency access; never copy a local `.env` into context.
3. Define non-root runtime identity, required filesystem writes, health/readiness behavior, signals and graceful shutdown, resource constraints and architecture compatibility.
4. Build and run a disposable fixture with expected config; inspect image history/files, test startup, termination, read-only filesystem where feasible, and dependency failure.
5. Report digest, size, vulnerabilities with relevance/patch status, provenance and remaining platform-specific constraints. Publishing and production rollout follow separate approvals.

Do not choose Alpine, distroless or rootless by slogan; verify native dependencies, debugging and operational needs against the actual application.
