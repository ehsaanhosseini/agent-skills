# Composition decisions

Start from consumers, not patterns. A `Dialog` with `compact`, `fullscreen`, `danger`, `noClose`, `loading` booleans may allow nonsensical combinations. If modes are mutually exclusive, use a variant discriminant; if content sections differ, expose slots or composed children. Keep state ownership explicit: the parent owns `open` when external navigation or another control must coordinate it; local state is fine for an isolated disclosure.

Example: a `Tabs` component can expose `Tabs.List`, `Tabs.Trigger` and `Tabs.Panel` when several children need coordinated selected state and keyboard behavior. A single `Button` with text and icon does not need this machinery. If context is used, guard against a child rendered outside its provider and test nested instances. Avoid deriving identity from child order if tabs may be conditional; stable IDs are clearer.

Use render props only when callers need internal state to render custom behavior. `children` is simpler for a static slot. Avoid cloning arbitrary children to inject props when it hides contracts or breaks refs. Check React version and framework constraints before choosing ref, server/client or context APIs. The [React state ownership guidance](https://react.dev/learn/sharing-state-between-components) is the baseline for moving state, not a mandate to lift all state globally.
