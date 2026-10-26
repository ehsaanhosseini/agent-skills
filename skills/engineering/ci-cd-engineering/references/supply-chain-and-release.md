# Supply chain and release promotion

Identify source commit, builder, dependencies, produced artifact digest, signing/attestation if required, promotion target and rollback artifact. A mutable tag is insufficient to prove the same bytes reached staging and production. Pin third-party actions to full commit SHAs where practical and review their permissions; GitHub's [secure use reference](https://docs.github.com/en/actions/reference/security/secure-use) recommends immutable pinning. Track update owners so pins do not become stale.

Example: build an image once, record digest `sha256:...`, deploy that digest to staging, run smoke/contract checks, then promote the identical digest after approval. If production deploy fails, restore the last known-good digest only after checking whether schema/data changes make application rollback unsafe. Record actual artifact and environment revisions, not only a green workflow badge.

Secrets belong in scoped environment stores or short-lived workload identity, not workflow YAML, build logs or PR artifacts. A failed required check, provenance mismatch, unreviewed dependency update or unavailable rollback path blocks release. Keep a manual override process with approver, rationale and audit trail; never encode “continue-on-error” as a silent bypass of a required gate.
