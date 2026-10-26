# Data, caching, and mutation security

Read the installed Next.js version's documentation before using caching defaults: they have changed across major releases. In current App Router documentation, identical `fetch` calls may be memoized during rendering while data caching is a separate choice. State whether a route is dynamic, cached, revalidated, or streamed, and test the observed result. Prefer direct server-side database access where appropriate; do not add an HTTP round trip to the same application without a reason.

For authenticated data, include the identity in the data-access boundary and avoid shared cache keys that could mix tenants. Do not pass server secrets to client components or `NEXT_PUBLIC_` variables. Check both route handler and Server Action authorization; either can be called outside the intended UI.

Example mutation shape (adapt imports to the installed version and application):

```ts
'use server'

export async function renameProject(projectId: string, formData: FormData) {
  const session = await requireSession();
  const project = await projects.findForUser(projectId, session.user.id);
  if (!project) throw new Error('Project not found');
  const name = parseProjectName(formData.get('name'));
  await projects.rename(project.id, name);
  // Use the version-appropriate revalidation API for the affected route/cache.
}
```

Test a valid owner update, malformed `name`, a different user's ID, missing session, and the refreshed view. The code fragment intentionally omits a universal revalidation call: cache tags, paths, and directives depend on the pinned framework version and actual data flow. Handle duplicate submission/idempotency when a repeated mutation could create side effects.
