# Platform and crawler boundaries

This retained filename is a compatibility path, not a claim that proprietary ranking factors are known.

## Access decision

Record the platform, retrieval mode, content URL and intended use: search indexing, model training or a user-triggered fetch. Inspect current official provider documentation for the specific user agent and verify authentic crawlers using provider-supported methods. A user-agent string can be spoofed. Preserve the owner's approved policy; an apparent block is a finding, not permission to remove protection.

OpenAI distinguishes OAI-SearchBot (search), GPTBot (training) and ChatGPT-User (user-triggered visits): [crawler documentation](https://developers.openai.com/api/docs/bots). Do not describe GPTBot as a prerequisite for search citations. Google Search AI features use normal Search eligibility; Google-Extended controls separate uses and is not an AI Overviews crawl toggle. Consult [Google's crawler list](https://developers.google.com/crawling/docs/crawlers-fetchers/google-common-crawlers) and [AI feature guidance](https://developers.google.com/search/docs/appearance/ai-features).

For Anthropic, Perplexity, Bing and other providers, verify current official docs when their access policy is actually in scope. Do not assume a fixed search backend, index partnership or citation algorithm from historic third-party posts.

## Diagnose before recommending

Separate robots directives, noindex, authentication, CDN challenges, HTTP errors, canonicalization and rendering. Compare actual response/rendered content and approved crawler policy. A missing citation alone proves none of these are broken. Training exclusion does not generally imply search exclusion; do not trade privacy/security for assumed visibility.

## Verification

For authorized changes, test affected and unaffected paths, cache variants and current robots semantics. Record exact evidence and repeat representative visibility observations. No universal schema boost, freshness multiplier, page-speed threshold or guaranteed citation effect is asserted.

Locally adapted 2026-11-04; upstream MIT provenance is retained in UPSTREAM.md. Historical third-party claims are not current official platform guidance.
