# Locators, fixtures, and state

Prefer locators tied to the accessibility tree, then scope to a meaningful region. Example:

```ts
test('editor can rename a project', async ({ page }) => {
  await page.goto('/projects');
  const row = page.getByRole('row', { name: /Quarterly plan/ });
  await row.getByRole('button', { name: 'Rename' }).click();
  await page.getByRole('dialog', { name: 'Rename project' })
    .getByLabel('Name').fill('Annual plan');
  await page.getByRole('button', { name: 'Save' }).click();
  await expect(page.getByRole('row', { name: /Annual plan/ })).toBeVisible();
});
```

The example assumes the fixture created a project and the user is authenticated. Create unique test data per worker, clean it through an authorized test API or disposable database, and avoid relying on test order. Reuse storage state only when identity and permissions remain valid; separate accounts for owner versus outsider tests.

Page objects are useful for a stable flow reused across tests; keep assertions near the behavior under test and avoid hiding every interaction behind opaque helpers. Use route mocking to simulate a specific failure or edge response, but retain an integration test against the real test service for the contract. Never record real credentials in traces.
