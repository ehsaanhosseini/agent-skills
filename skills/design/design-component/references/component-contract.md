# Component contract

Record: purpose; semantic element; anatomy and slots; variants; state transitions; content limits; event/API contract; ownership of value, focus and validation; token mappings; responsive behavior; supported platforms. The spec should allow a reviewer to distinguish a bug from a design choice.

Example: a `SearchField` has label, input, clear button, suggestion list and status text. State transitions include idle → typing → loading → results/empty/error. If the caller controls `value`, it owns updates and must receive `onChange`; the component still owns ephemeral popup focus. The clear button needs an accessible name and must not unexpectedly submit the form. Error text needs a programmatic association. A “loading” visual should not make the input silently unusable.

Decision criteria: use a native input for text entry; introduce a combobox pattern only if suggestions are selectable and keyboard navigation is required. A separate “compact” visual variant may be justified by layout, but a boolean for every icon/color/size combination creates contradictory props. Define mutually exclusive variants or slots. For a one-off page arrangement, composition may be simpler than a new shared component.

Before changing an established API, inventory usages and decide whether a compatibility wrapper or codemod is needed. A breaking visual change can be as disruptive as a type change; compare key consumers and states.
