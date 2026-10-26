# Runtime boundaries

TypeScript annotations disappear at runtime. Start untrusted values as `unknown`, inspect only the fields needed, and keep an explicit error path. Reuse the project's schema library when present; a small stable shape may justify a manual guard.

```ts
type User = { id: string; role: 'reader' | 'editor' };

function parseUser(value: unknown): User {
  if (typeof value !== 'object' || value === null || Array.isArray(value)) {
    throw new Error('Expected a user object');
  }
  const record = value as Record<string, unknown>;
  if (typeof record.id !== 'string' || record.id.length === 0 ||
      (record.role !== 'reader' && record.role !== 'editor')) {
    throw new Error('Invalid user fields');
  }
  return { id: record.id, role: record.role };
}

const response = await fetch('/api/me');
if (!response.ok) throw new Error(`User request failed: ${response.status}`);
const user = parseUser(await response.json());
```

The `Record` assertion follows an object check and permits indexed inspection; it does not assert the `User` shape. Decide whether unknown extra fields are tolerated or rejected. Test `null`, arrays, missing fields, wrong enum values, empty IDs, unsuccessful HTTP responses, and malformed JSON. If a schema library transforms values, derive the output type from its schema rather than maintaining a duplicate interface.

Do not use `as User` on `response.json()` or non-null assertions on optional data without a demonstrated invariant. Distinguish programmer errors from expected invalid input, and do not log confidential payloads.
