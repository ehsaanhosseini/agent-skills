---
name: react-performance
description: Review or improve React and Next.js rendering, data fetching, and bundle performance in an actual project. Use for performance work on React/Next code; not for Flutter or static Figma designs.
---

# React performance

Measure the slow path and identify whether delay comes from serial fetches, large client bundles, server work, hydration, or avoidable rerenders. Prioritize independent fetches running in parallel, server/client boundary placement, and loading only code needed for the current route or interaction. Inspect bundle output before adding dynamic imports; extra splitting has costs. Use framework APIs supported by the project's pinned React/Next versions.

For rerenders, locate the expensive subtree with profiler evidence before adding memoization. Keep state near consumers, derive values during render when safe, and avoid effects that merely mirror props/state. Preserve correctness of caching, authentication, and request isolation. Verify with the project's tests plus before/after timings or bundle sizes; report the measurement environment and any uncertainty.

Original concise adaptation of selected Vercel `react-best-practices` guidance at commit `063bee94c3f4df8453406c830b0a7df0f2860278`; no live rule fetch or dependency is required.
