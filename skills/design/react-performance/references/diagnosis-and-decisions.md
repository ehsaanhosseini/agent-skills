# Performance diagnosis and decisions

Build a trace for the affected journey. Record navigation type, cache state, network timing, server response, JavaScript transfer/parse, hydration and interaction delay, and React commit/profile evidence. Repeat with realistic data size and the supported device class. A slow interaction after load is different from a slow initial route.

Decision examples:

| Evidence | Candidate action | Caution |
|---|---|---|
| Two independent API requests serialized | Start them together and join results | Do not parallelize dependent requests or hide an authorization failure. |
| Route downloads a large editor before user opens it | Load editor on intent/route | Measure extra request and loading UX; preserve keyboard path. |
| Profiler shows repeated expensive child commit on unrelated parent state | Move state closer or stabilize props; consider memoization | Check stale closures and actual commit duration after change. |
| HTML arrives fast but main thread blocks during hydration | Reduce client work or boundary size | Do not move private data to a shared cache. |

Core Web Vitals can guide user impact, but lab and field results answer different questions. Record exact metric source and attribution; do not promise a threshold from one local run. Use [React performance APIs](https://react.dev/reference/react/memo) and framework documentation matching the installed version.
