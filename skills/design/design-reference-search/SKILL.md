---
name: design-reference-search
description: Search a pinned local UI reference catalog for a specific chart, product pattern, style, palette, or typography question. Use as optional inspiration after the project brief is understood; do not treat retrieved rows as a design specification.
---

# Design reference search

The local CSV catalog is a reviewed subset of UI/UX Pro Max at commit `7246805992a42b7bba37d4cac83b01416f0c6c44`. It is available offline. Query one domain at a time and use brief-specific terms rather than a full paragraph:

```bash
python3 "$HOME/.agents/skills/design-reference-search/scripts/search.py" --domain charts --query 'trend over time line accessible'
python3 "$HOME/.agents/skills/design-reference-search/scripts/search.py" --domain products --query 'real estate property'
```

Use the equivalent path to this skill folder when the shared symlink has not been set up yet.

Domains: `products`, `app-interface`, `styles`, `colors`, `typography`, `charts`, `ux-guidelines`, `landing`. The search returns a few ranked rows, or an empty result when a multi-term query has no strong keyword/title match. Inspect the source row and check its platform, context, accessibility, and license before using it. Do not automatically import its palette, landing pattern, chart, or font pair. In the comparative audit, Pro Max categorized PMS and ceramics briefs incorrectly, so a plausible row is only a candidate for review.

The search script uses Python's standard library, writes nothing, makes no network request, and has no install step. The upstream generator, updater, fonts, and other scripts are not bundled.
