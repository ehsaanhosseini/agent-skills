# Stack guide

- **React Native:** prefer the project's setup (Expo or bare); typed navigation; server state via a query library; Hermes; avoid unnecessary native modules; check New Architecture compatibility before adding libraries.
- **Flutter:** feature folders, one state approach already in use (Riverpod, Bloc, Provider), `const` widgets, platform channels only when needed, `flutter analyze` and widget tests.
- **Swift/SwiftUI:** state via `@State`/`@Observable`-style models matching the deployment target, async/await, Keychain for secrets, Previews for states, XCTest/Swift Testing.
- **Kotlin/Jetpack Compose:** unidirectional state with ViewModel, Flow, Hilt or the existing DI, Room for offline, stateless composables, Compose UI tests.
- Shared: generate API clients from the contract when available; one source of design tokens; feature flags for risky changes.
