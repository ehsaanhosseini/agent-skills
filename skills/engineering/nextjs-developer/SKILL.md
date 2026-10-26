---
name: nextjs-developer
description: Implement or review a Next.js application when App Router routing, server/client boundaries, data caching, mutations, or deployment behavior are central. Use the project's installed Next.js version and existing router; not for generic React styling or performance-only reviews.
---

# Next.js developer

Identify the installed Next.js and React versions, router (`app` or `pages`), rendering target, hosting mode, authentication model, and existing tests before applying a pattern. Keep a Pages Router application working unless migration is requested. Read [data and security](references/data-and-security.md) for caching, mutations, and authorization; read [routing and verification](references/routing-and-verification.md) for route boundaries, states, and release checks. For measured React performance, use `react-performance` as a focused complement.

1. Map the user path, route segments, data dependencies, and server/client boundary. Put interactive code in a client component only when it needs browser capabilities.
2. Decide per data source whether freshness, request isolation, and cache reuse are appropriate for the installed version. Never cache user-specific data across identities.
3. Treat Server Actions and route handlers as public entry points: authenticate, authorize the resource, validate input, and handle errors before mutation. A hidden button is not an access control.
4. Add loading, error, not-found, and metadata behavior where the route's actual UX needs them. Do not generate boilerplate files for every segment.
5. Run the project's type check, tests, and production build. Verify a normal path, invalid input, denied access, stale-data/revalidation behavior, and one failed downstream request.

Explain the selected rendering/cache behavior against the installed version and point to the affected routes. Deployment or environment changes follow the project's approval process. Do not assume a Lighthouse score threshold or Vercel hosting without a project requirement.
