---
name: configuration-secrets
description: Review environment configuration and secret lifecycle across build, CI, runtime, and deployment. Use for config drift, credential exposure, rotation, and least-privilege design; not for extracting or publishing secrets.
---

### Local policy (agent-skills)

> Never print, copy, commit, or upload secret values. Rotation, access-policy changes, and live configuration changes require explicit authorization and an approved recovery path.

# Configuration and secrets

Inspect environments, config schema, secret store, deployment mechanism, access roles, rotation requirements and audit trails. Read [configuration contracts](references/configuration-contracts.md) and [secret lifecycle](references/secret-lifecycle.md).

1. Inventory required settings by name, type, owner and environment without collecting values. Separate public build-time config from private runtime credentials.
2. Validate missing, malformed, incompatible and stale configuration at startup or deployment gate; avoid silent defaults for security-critical values.
3. Trace each secret from provisioning through CI/build/runtime, rotation and revocation. Enforce least privilege, short lifetime where possible and redaction in logs/artifacts.
4. Test with synthetic values in isolated environment: absent secret, expired credential, rotation overlap and rollback. Verify the service fails safely and remains observable without disclosing values.
5. Document source of truth, access approval, change history, recovery owner and remaining platform-specific gaps. Do not rotate live credentials as a review step.

`infrastructure-code-review` handles state and IaC plans; this skill handles application/environment configuration contracts and credential lifecycle.
