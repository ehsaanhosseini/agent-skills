---
name: mobile-engineering
description: Build or review native and cross-platform mobile apps in React Native, Flutter, Swift/SwiftUI, and Kotlin/Jetpack Compose, covering architecture, offline, auth, release, and testing. Use for mobile app code and architecture; for mobile-web polish use mobile-native, for screen design use figma-deliverables.
---

# Mobile engineering

Detect the stack from the project (package.json, pubspec.yaml, Xcode project, Gradle) and follow its existing conventions. Read [stack guide](references/stacks.md) for the chosen framework and [mobile quality](references/mobile-quality.md) for cross-cutting checks. Use `api-designer` for the backend contract and `design-tokens` for shared tokens.

1. Confirm target platforms, minimum OS versions, offline needs, and release channel. Choose cross-platform only when it fits team and feature needs; do not rewrite an existing stack unasked.
2. Structure by feature with a clear data layer, state management, and navigation; keep business logic out of views.
3. Handle auth and token storage in secure storage, API errors, retries, pagination, and offline queues with conflict rules.
4. Treat permissions, push notifications, deep links, and background work as flows with denial and failure paths.
5. Cover accessibility (dynamic type, screen reader, touch targets), RTL and localization, and low-end device performance.
6. Test: unit for logic, component/UI tests for key flows, and a device or simulator run. Report what was not run (physical device, store build).

Never commit signing keys, API secrets, or store credentials. Release steps are a checklist for the owner, not automated submission.
