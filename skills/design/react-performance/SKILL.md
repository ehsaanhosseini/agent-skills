---
name: react-performance
description: Review or improve React and Next.js rendering, data fetching, and bundle performance in an actual project. Use for performance work on React/Next code; not for Flutter or static Figma designs.
---

# React performance

Identify a user-visible symptom and measurement environment before changing code. Read [diagnosis and decisions](references/diagnosis-and-decisions.md) for network/render/bundle triage and [verification and regressions](references/verification-and-regressions.md) for experimental controls.

1. Capture baseline route, device, network, data size, React/Next versions and profiler or browser trace. Distinguish server time, serial requests, bundle/parse, hydration and expensive updates.
2. Choose a change tied to the measured bottleneck. Parallelize only independent requests; split code only when transfer and parse savings exceed extra round trips; memoize only a demonstrated expensive subtree with stable dependencies.
3. Preserve request identity, authorization and cache freshness. For Next.js, verify installed version's server/client and caching semantics with `nextjs-developer` when route behavior is central.
4. Test normal and failure paths, including stale data, changed props, slow network and hydration. Guard against a faster but incorrect UI.
5. Compare before/after runs under matched conditions and report median/distribution, bundle change and uncertainty. Revert or revise when improvement is noise or shifts cost to another route.

Do not introduce blanket `useMemo`, dynamic imports or cache directives. This expands the existing Vercel-informed adaptation at `063bee94c3f4df8453406c830b0a7df0f2860278`; no live rule fetch is required.
