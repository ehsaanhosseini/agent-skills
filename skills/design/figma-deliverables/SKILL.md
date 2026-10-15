---
name: figma-deliverables
description: Plan, design, audit, and hand off complete Figma deliverables for responsive websites, dashboards, and native mobile apps. Use for new or revised product designs, whether mobile-first or desktop-first, including native-only iOS/Android projects.
---

# Figma Design Deliverables — Engineering-Ready

**Purpose:** ensure a designer or design agent delivers implementable, auditable UI/UX rather than disconnected attractive screens. Apply automatically when scoping, creating, revising, or auditing an entire Figma product design. Use proportionate depth; do not inflate simple projects. Follow the active task scope and session instructions; this checklist grants no additional permissions or tool capabilities.

## 1. Scope first

- Identify in-scope surfaces independently: desktop web, tablet web, mobile web, iOS app, Android app, admin/back office.
- Choose **Mobile-first** when mobile is the primary web journey; **Standard (desktop-first)** when desktop is primary. This changes design order, never the obligation to cover other in-scope surfaces.
- A native app is **not** a responsive web frame. If iOS/Android is in scope, design its own navigation, screens, platform interactions, permissions, system states, and handoff in the **same Figma project**, using shared foundations and platform-specific patterns.
- For native-only scope, mark the web track N/A and sequence the scoped native journeys directly; do not invent web deliverables. Record the approved target OS versions, device classes and platform guidance before specifying native patterns.
- Select complexity: **Foundation** (simple site), **Product** (marketplace/app/CMS), **Enterprise** (multi-role/complex operational system). These change depth, not the baseline clarity requirement.
- Inventory screens, features, roles, content, integrations, decisions, critical journeys, and intentionally excluded platforms. Flag unresolved requirements as decisions, not fabricated designs.

## 2. Deliverables checklist — common to both tracks

For each item mark PASS / WARN / FAIL / N/A, link evidence to the Figma page/frame/component, and explain N/A.

1. **Project guide:** cover, scope, surfaces, target devices, status/approval, design version, owners and open decisions.
2. **Product structure:** information architecture/sitemap, navigation by role and platform, user flows with success/failure branches.
3. **Wireframes when helpful:** enough to validate hierarchy and journeys before detailed visuals; avoid duplicate artifacts without decision value.
4. **Foundations:** color/type/spacing/radius/elevation, semantic tokens and theme modes actually supported; alias/mapping contract for web/mobile implementation.
5. **Components:** reusable components, variants/properties, states, focus, responsiveness, behavior notes, accessible labels and usage constraints.
6. **Final UI:** all in-scope core screens with realistic representative content and shared component instances.
7. **State coverage:** loading/skeleton, empty, error/retry, success, disabled, validation, session/authorization/permission, partial data, timeout/offline wherever applicable; use centralized component states, screen-specific examples only where behavior differs.
8. **Responsive/adaptive:** representative frames plus explicit fluid/container/min-max/overflow/wrapping/reflow rules and intermediate-width behavior, including widths immediately below/at/above each content-driven breakpoint; avoid treating three screenshots as responsive proof.
9. **Interaction:** clickable core and high-risk flows, input validation, navigation and back/escape, dialog dismissal, scrolling, keyboard and error recovery documented.
10. **Localization & content:** language/RTL-LTR when scoped, text expansion, dates/numbers/currencies, missing/long content and content ownership.
11. **Accessibility:** for Figma-only work, inspect design properties and specify intended focus, semantics and assistive-technology behavior; mark runtime checks untested until implementation. For native apps, specify platform text scaling, screen-reader order/labels, target sizes, safe areas and system back/gesture behavior against the approved platform guidance. WCAG 2.2 AA targets where applicable; test contrast, logical focus, keyboard, reflow, labels, and platform input. WCAG 2.5.8 sets a 24 CSS px minimum with exceptions; prefer 44×44 CSS px as an internal touch design target when feasible, not a universal WCAG minimum.
12. **Handoff:** named layers, maintainable Auto Layout where appropriate, documented component/token mappings (CSS/Tailwind/Flutter etc.), exportable assets, interaction contracts, responsive specs, decisions and unresolved risks.
13. **Quality evidence:** review findings and owners; mark not-tested/unverifiable items as WARN or FAIL according to impact, never PASS by assumption.

## 3. Track-specific sequence

### Mobile-first web
- Plan mobile web information architecture and compact navigation first.
- Design mobile web core screens, touch/keyboard behavior, filters/forms and narrow-width states.
- Adapt to tablet and desktop web, revisiting layout and information density rather than stretching frames.
- **If native app is in scope**, separately design iOS and Android navigation/journeys/states/platform differences alongside mobile web work, sharing tokens where technically appropriate.
- Validate all scoped surfaces and handoff.

### Standard (desktop-first)
- Plan desktop structure, density, navigation, keyboard and high-information workflows first.
- Design desktop web core screens, complex tables/forms and desktop interactions.
- Adapt to tablet/mobile web, redesigning dense tables, navigation and bulk actions for narrow widths.
- **If native app is in scope**, separately design the native iOS/Android experiences, not just resize desktop or mobile web screens.
- Validate all scoped surfaces and handoff.

## 4. Suggested Figma pages (combine when small)

00 Cover & Scope; 01 Architecture & Flows; 02 Foundations & Tokens; 03 Shared Components; 04 Web Desktop; 05 Web Tablet & Mobile; 06 App iOS; 07 App Android; 08 States & Edge Cases; 09 Prototypes; 10 Handoff & Decisions; 11 Archive.

Omit out-of-scope platforms; order screen pages by the selected track. Keep app and web in the same Figma project, with clearly distinguished platform-specific components. Avoid unnecessary duplicates.

## 5. Quality gates

**Gate A — Design readiness, before implementation:** verify requirements/feature-to-screen coverage, flow completeness, tokens/components, interactions/states, responsive/adaptive and native specifics, accessibility risks, handoff and feasibility. A blocking FAIL prevents declaration of handoff-ready. WARN needs owner, impact, and follow-up; N/A needs rationale.

**Gate B — Design-to-code fidelity, after implementation:** compare actual rendered states, tokens, behavior, keyboard/accessibility, responsive breakpoints and platform differences against approved designs. This is a separate gate and does not retroactively replace Gate A. Do not claim code behavior was validated from Figma alone.

For every checked criterion record ID, applicability, severity (blocker or advisory), test method, evidence link, verdict and responsible owner. Never infer a PASS from an unchecked frame, a screenshot, or an inaccessible prototype. Manual/tool-limited evidence is explicitly labeled.

## 6. Reuse existing specialist skills

- [design-tokens](../design-tokens/SKILL.md): token architecture/mapping.
- [design-component](../design-component/SKILL.md): component anatomy, properties, states and API.
- [a11y-audit](../a11y-audit/SKILL.md): accessibility evaluation.
- [design-qa](../design-qa/SKILL.md): measurable design quality checks.
- [mobile-native](../mobile-native/SKILL.md): mobile-web device behavior, safe areas, viewport and keyboard; it does not provide native iOS/Android design guidance.
- [data-dashboard](../data-dashboard/SKILL.md): high-density operational screens.
- [design-critique](../design-critique/SKILL.md): qualitative visual critique.

Load only specialists relevant to the scoped task, preserving their own invocation and implementation boundaries. For native app details, use the approved platform guidance rather than applying mobile-web CSS rules. These specialist skills remain sources of detail; do not duplicate or override them. Respect project-specific design language and already approved decisions.

## Completion report

Report scoped platforms and chosen track/tier; Figma page/frame links; covered vs missing screens, journeys and states; Gate A result by criterion with evidence; explicit blockers, warnings, untested items, and decisions requiring approval. Do not describe an incomplete design as production-ready.
