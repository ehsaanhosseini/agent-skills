# HTTP contract design

Start from a concrete caller workflow. Example: create an order once even if a mobile client retries after a timeout. `POST /orders` can accept an idempotency key, validate item IDs and quantities, authorize the account, and return `201 Created` with `Location`. The server must define the key scope, lifetime, duplicate response, and concurrent retry behavior; a header alone provides no idempotency.

An illustrative contract fragment:

```yaml
paths:
  /orders:
    post:
      summary: Create an order
      security: [{ bearerAuth: [] }]
      parameters:
        - in: header
          name: Idempotency-Key
          required: true
          schema: { type: string, minLength: 1, maxLength: 128 }
      requestBody:
        required: true
        content:
          application/json:
            schema:
              type: object
              required: [items]
              properties:
                items:
                  type: array
                  minItems: 1
                  items:
                    type: object
                    required: [productId, quantity]
                    properties:
                      productId: { type: string }
                      quantity: { type: integer, minimum: 1 }
      responses:
        '201': { description: Created }
        '400': { description: Invalid request }
        '401': { description: Authentication required }
        '409': { description: Conflicting idempotency key or resource state }
```

This is a decision example, not a full OpenAPI document. Add component schemas, response bodies, error definitions, examples, and auth scheme before publishing. Avoid revealing whether another tenant's resource exists when a `404` response is the product's privacy policy. For listing endpoints, define stable sort order, cursor encoding/expiry, and how deletions or inserts affect page continuity. Offset pagination may be adequate for small stable collections.

Verification: parse/lint the complete spec with a pinned local tool, run contract tests against implementation, check authorization for another account, retry behavior, malformed JSON, and maximum payload size. A valid spec is not proof of correct server behavior.
