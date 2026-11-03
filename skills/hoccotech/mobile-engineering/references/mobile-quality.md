# Mobile quality

- Secure storage for tokens; no secrets in the bundle; certificate and transport rules per platform; jailbreak/root checks only if the threat model needs them.
- Offline: define read cache, write queue, conflict policy, and user-visible sync state.
- Performance: cold start, list virtualization, image sizing, main-thread work, memory on low-end devices.
- Release: versioning, staged rollout, crash reporting without personal data, rollback plan, store privacy declarations matching real data use.
- Test matrix: smallest and largest screens, light/dark, large text, RTL, slow network, permission denied.
- Health or payment apps: involve compliance review before release.
