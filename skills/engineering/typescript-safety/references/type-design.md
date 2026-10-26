# Type design and compiler changes

Use discriminated unions when operations differ by state. Make the discriminator a literal and check exhaustiveness:

```ts
type LoadState =
  | { kind: 'idle' }
  | { kind: 'loading' }
  | { kind: 'ready'; items: readonly string[] }
  | { kind: 'failed'; message: string };

function label(state: LoadState): string {
  switch (state.kind) {
    case 'idle': return 'Not started';
    case 'loading': return 'Loading';
    case 'ready': return `${state.items.length} items`;
    case 'failed': return state.message;
    default: return assertNever(state);
  }
}
function assertNever(value: never): never { throw new Error(`Unhandled state: ${value}`); }
```

Use a branded value only when same-shaped values are commonly confused. Keep its constructor at the boundary and test it; a direct cast defeats the guarantee. Prefer a simple generic constrained to what its implementation reads. Avoid recursive conditional types when an interface or overload communicates the contract more clearly.

Before changing `strict`, `exactOptionalPropertyTypes`, `noUncheckedIndexedAccess`, `moduleResolution`, or declaration output, inspect the installed compiler, bundler, framework, and downstream packages. Run the project's type check first and record baseline diagnostics. Make one flag change at a time. A library may need declarations; an application may not. Confirm emitted module paths when module settings change.

Verify valid and invalid public API examples, type-check dependent packages where available, run runtime parsing tests, and compare diagnostics and build time after a compiler change. A compile-only test cannot establish runtime validity.
