# Marketing integration review — 2026-11-04

Owner/reviewer: repository owner for final release review. Implementation and independent read-only routing/safety evaluations are recorded below; no release approval is implied.

## Scope and decisions

Baseline: 58 registered skills, 12 from Marketing Skills. Source HEAD inspected and pinned to `88c79f6528a9347420e57ceb1fff9a60de651768` (2026-10-30). Source: https://github.com/coreyhaines31/marketingskills. MIT license is byte-identical to the retained upstream/marketingskills/LICENSE.

All 53 source skills are assessed in [marketing-assessment.tsv](marketing-assessment.tsv), including source resource counts, excluded executable paths, dependency decisions, target and rationale. Decisions: **39 ADD, 11 ENHANCE, 2 KEEP, 1 SKIP**. ENHANCE counts source skills: 10 existing local skills improved plus marketing-ideas folded into the newly added marketing-plan. Final registry: **97 skills**.

Added IDs: `ab-testing`, `ad-creative`, `ads`, `aso`, `attribution`, `churn-prevention`, `co-marketing`, `community-marketing`, `competitors`, `conversion-tracking`, `copy-editing`, `copywriting`, `directory-submissions`, `emails`, `events`, `free-tools`, `marketing-image`, `influencer-marketing`, `launch`, `lead-magnets`, `link-building`, `marketing-loops`, `marketing-plan`, `marketing-psychology`, `offers`, `onboarding`, `paywalls`, `popups`, `pricing`, `programmatic-seo`, `public-relations`, `referrals`, `reverse-engineer-marketing`, `revops`, `sales-enablement`, `signup`, `sms`, `social`, `marketing-video`.

Enhanced targets: `ai-seo`, `analytics`, `cold-email`, `competitor-profiling`, `cro`, `marketing-plan`, `product-marketing`, `prospecting`, `schema`, `seo-audit`, `site-architecture`. Kept: `content-strategy`, `customer-research`. Skipped: marketing-council, whose simulated named-person dossiers add maintenance and redundant strategy framing rather than a necessary capability.

## Architecture and adaptation

Preserve existing categories, registry TSV contract, source registry, licenses, protected IDs, scripts and symlink discovery. No package/framework, submodule, scheduler or orchestration layer added. image/video become marketing-image/marketing-video to narrow discovery. marketing-ideas becomes a conditional initiative menu instead of another broad strategy router. Specialized store, lifecycle, commerce, partner, community, events, creator, PR, referral and revenue capabilities remain distinct.

Each new skill contains a portable entrypoint, self-contained playbook, source/modification reference and injected local policy. References load conditionally; optional historical upstream links are not runtime dependencies. Selected methods are reauthored for authorization, privacy, industry fit and practical verification; this does **not** claim verbatim or complete procedural equivalence to every upstream reference. Pricing, RevOps, Ads, ASO and conversion delivery include additional detailed analytical/verification references after independent depth review. Cross-industry planning distinguishes SaaS adoption, marketplace liquidity, commerce orders, guest bookings and regulated-service constraints.

Existing baseline source SHA `5b2c0007766c6a1cf1d53fd8fc73e979e0821022` remains in existing registry rows; supplemental SHA appears in notes and references. This avoids falsely labeling old untouched prose as a verbatim newer version. Adapted skills are marked to reject verbatim upstream.sh apply. Existing policy blocks remain intact.

## Comparison and quality assessment

Current source tree inventory, entrypoint/task metadata, selected source methods and baseline/source diffs informed the assessment. Content-strategy's small information-gain/editorial changes and customer-research's routing/tool-link changes do not justify a duplicate or replacement. Existing engineering/design/data capabilities were compared by outcome rather than name; business KPI design, operational dashboards, product architecture and mobile implementation keep their existing owners.

License: compatible MIT attribution retained. Practical value: distinct job and useful decision method required. Instruction quality: inputs, tradeoffs, example, failure checks and observable verification added. Dependencies: all raw tooling optional/excluded. Security/privacy: local policy prevents advice from granting external effects. Maintenance: pinned source plus manual review; no automatic syncing. Portability: ordinary name/description Markdown, local resources and existing symlink paths; no vendor-only runtime APIs. Routing: narrow outcome-based descriptions and conditional neighbors in skill-routing.md. A static pass cannot prove behavioral quality.

## Security review (12-question checklist)

1. Existing coverage? Compared all 53 against 58 registered task contracts; overlap is kept or enhanced, not duplicated by name alone.
2. Material improvement? ADD closes a distinct workflow; ENHANCE names the evidence/method delta in the assessment.
3. Overlap? Explicit neighbors distinguish measurement/delivery/attribution, registration/activation/retention, public conversion/in-product paywalls, product research/comparison pages/growth timelines.
4. Executed code? No upstream code executed or imported. New skill payloads are Markdown only; existing approved executable/hash unchanged.
5. Injected context? Reviewed local entrypoint/playbook/policy only; no generated context, hooks or auto-created marketing files.
6. Network? No mandatory runtime request. Public research uses only available authorized tools when task-relevant; no automatic external APIs or uploads.
7. Writes? Skill advice/drafts do not authorize live writes, publication, spend, messages, recurring jobs or tracking changes.
8. Repository modifications? This mission changes only library content/registry/docs/evaluation fixtures and related discovery links. Future skill actions remain task-authorized.
9. Pinnable? Full source commit recorded; old baseline preserved separately.
10. Verifiable provenance? Public Git commit and MIT license inspected; no claim of signed/attested executables. No source executable trusted.
11. Controllable telemetry/network? None in new Markdown payloads. Source tools/integrations, collectors, recipes, snippets and templates excluded.
12. Confidentiality? Generic/synthetic examples only; private project/client data remains outside this public repository. Data collection, consent and suppression boundaries explicit.

Source executable/asset paths are listed but **not** claimed audited or tested as approved runtime code. A whole-tree source text/hash sweep hit local read timeouts on excluded files and was stopped; it is not reported as a successful audit. This does not leave executable material in the integration: none is imported. No blanket upstream safety endorsement is made.

Prompt injection is treated as untrusted source data. Fixes include truthful outreach subjects, no sensitive personalization, optional authorized deliverability validation, no platform-law exemption, transparent cancellation, stable conversion deduplication, and no hashed health-data uploads. Existing SEO prose was corrected where it contradicted current official guidance; no guaranteed ranking/citation effects, guessed search backends or training/search crawler conflation remain in revised AI SEO guidance.

## Official guidance reviewed

- [Google AI features](https://developers.google.com/search/docs/appearance/ai-features): ordinary SEO foundations; no special AI markup/files required.
- [Google spam policies](https://developers.google.com/search/docs/essentials/spam-policies) and [generative AI content](https://developers.google.com/search/docs/fundamentals/using-gen-ai-content): original value and non-manipulative content.
- [Google crawler list](https://developers.google.com/crawling/docs/crawlers-fetchers/google-common-crawlers), [OpenAI crawlers](https://developers.openai.com/api/docs/bots): do not conflate search/training/user retrieval.
- [Google localized versions](https://developers.google.com/search/docs/specialty/international/localized-versions), [canonicalization](https://developers.google.com/search/docs/crawling-indexing/consolidate-duplicate-urls), [retired sitelinks search box](https://developers.google.com/search/blog/2024/10/sitelinks-search-box).
- [Apple listing/search](https://developer.apple.com/app-store/search/) and [Google Play listings](https://support.google.com/googleplay/android-developer/answer/13393723): current constraints/claims verified when applied, no copied speculative density/boost targets.

## Verification evidence

39 new and 10 changed-skill regression scenarios added. Fixture-contract validation is distinct from executed model reasoning. Independent read-only evaluation exercised all 10 requested scenarios plus 4 engineering/design controls, with actual file reading and response outlines; a separate safety evaluation exercised 6 adversarial requests. Initial findings were corrected and targeted follow-up requested. Detailed results and command outcomes are maintained in [marketing-verification.md](marketing-verification.md).

No live ad, analytics, billing, outreach or store operations are tested or authorized. No separate Claude Code/Cursor behavioral run is claimed. Portable metadata, references and discovery checks demonstrate installation compatibility only, not identical model behavior.

## Git/release boundary

Work uses one local feature branch in the existing canonical checkout because the repository prohibits implementation on main. Initial tree was clean. No unrelated user work existed to overwrite. No worktree, push, PR, merge, deployment or GitHub Actions trigger is part of this mission. The existing validate-skills workflow would run on configured remote events; it is unchanged and untriggered. All quality checks run locally. Final owner review remains a release decision, not an unfinished implementation task.
