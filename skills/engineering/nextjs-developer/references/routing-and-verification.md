# Routing and verification

Map layouts, pages, route handlers, metadata, and client boundaries before editing. A layout persists across child navigation; a template remounts. Add `loading.tsx` or Suspense at a boundary where progressive feedback helps; add `error.tsx` where recovery is meaningful. Handle not-found behavior separately from an unexpected exception. Avoid placing a client directive high in the tree solely for one interactive leaf.

Choose metadata from route content with the framework's Metadata API when the installed router supports it. Check canonical URLs and indexing for public pages; do not expose private resource titles to unauthenticated users. Images/fonts should follow project constraints; `next/image` is useful when its optimization path is supported, but remote domains, static export, and CDN behavior may change the choice.

Verification matrix:

| Case | Observe |
|---|---|
| Direct URL and client navigation | Same content and auth outcome; no hydration error |
| Slow dependency | Intended loading boundary and no layout jump |
| Missing record | Not-found state, correct status, no private details |
| Failed dependency | Error state/retry path, safe logging |
| Mutation | Authorization, validation, duplicate submission, fresh view |
| Production build | Type errors, server/client import boundaries, output mode |

Run the project's existing commands and record the exact version. If the build requires unavailable secrets or network services, report that limitation and test what can run locally. Compare route timing or bundle output only when optimizing performance; a generic score target is not evidence.
