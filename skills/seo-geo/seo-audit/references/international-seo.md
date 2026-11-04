# International SEO review

Use [Google localized-version guidance](https://developers.google.com/search/docs/specialty/international/localized-versions) and [canonical guidance](https://developers.google.com/search/docs/crawling-indexing/consolidate-duplicate-urls), reviewed 2026-11-04. Preserve approved locale routing, indexing and canonical decisions; audit does not authorize changing them.

1. Inventory actual language/region URLs, equivalent clusters, fallback and missing translations. Use rendered content/routes and sitemap evidence, not labels alone.
2. For implemented hreflang, verify supported codes, fully qualified URLs, self references and reciprocal alternates. A broken pair can be ignored; one failure does not necessarily invalidate every locale. HTML, HTTP header and sitemap methods are equivalent for Google; use the maintained project source rather than requiring all three.
3. Compare declared/observed selected canonicals, redirects, indexability and hreflang. Distinguish true translations from same-language duplicates. Align signals with intended equivalents; do not require every regional duplicate to self-canonical or invent differences to force indexing.
4. Inspect crawlable language switching, pagination, currency/availability differences, metadata, sitemap limits and fallback. Avoid redirects that prevent access to another language.
5. For thin/incomplete locales, report user-value gaps and preserve approved policy. There is no blanket always-index or always-noindex rule based on locale count.

Verification: table representative URL, status, content language, canonical, robots/noindex, alternates and reciprocal links. Include normal, missing translation, pagination, regional duplicate and fallback cases. Separate local validation, Search Console evidence and unverified engine selection. No ranking/crawl-budget guarantees.

Locally adapted from the pinned MIT source; unsupported third-party statistics and blanket requirements removed during integration. Source versions remain in UPSTREAM.md.
