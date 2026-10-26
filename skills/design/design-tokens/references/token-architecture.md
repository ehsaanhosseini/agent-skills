# Token architecture

Use names that express intent at the consumer layer: `color.text.primary`, `color.surface.raised`, `color.border.focus`, `color.status.error`. A primitive such as `blue.600` may feed a semantic alias but should not be the component's public contract. Component aliases such as `button.primary.background` are justified when many buttons share a state contract and a system-level semantic alias is too broad.

Example: light `color.text.primary` resolves to `gray.900`; dark resolves to `gray.050`. `color.status.error` must not automatically resolve to brand red if brand colors change independently. Record each token's type, unit, mode, description, owning team and deprecation state. Keep spacing values in a documented unit and decide whether scaling is responsive, density-based or fixed.

Validation rules: aliases resolve to a token of compatible type; no cycles or dangling references; every required mode resolves; exported names are unique after target-language normalization; color pairs meet the selected contrast target when rendered together. A semantic token that passes on a flat surface may fail on a translucent overlay or image; rendered checks remain necessary.

The [Design Tokens Community Group format](https://www.designtokens.org/tr/2025.10/format/) can guide interoperable representation, but check the exact tool/version implementation before assuming support for every feature.
