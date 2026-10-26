# Skill quality and release gates

## Repeatable commands

Run from the repository root. `scripts/validate.sh --strict --repo-only --online` is the release gate; `--repo-only` omits the workstation link check. `python3 scripts/quality_check.py` checks Agent Skills metadata, registry coverage, local links and the approved executable inventory. `bash scripts/upstream.sh table` regenerates the provenance table for comparison with `UPSTREAM.md`; the validator checks registry SHA provenance. Run shell syntax and Python compilation for repository scripts, inspect changes with `git diff --check`, and review the final PR diff. Online validation requires access to GitHub and fails closed on unavailable network; report unavailability rather than calling it a pass.

| Gate | Evidence required | What it does not prove |
|---|---|---|
| Registry/provenance | 51 unique entries, 41 protected IDs preserved, reviewed SHA and license for each source | Domain correctness |
| Metadata/resources | Valid frontmatter, descriptions, local links, referenced files, one hash-approved skill executable | Agent follows instructions |
| Strict/online | Repository validator success with pinned remotes reachable | Upstream commands are safe to run |
| Security review | All candidate references inspected; no imported scripts/hooks; policies on restricted work; script hash unchanged | Every future implementation is secure |
| Compatibility | Claude/Codex/Cursor skill discovery links and registry routes; no vendor-only frontmatter required | Identical behavior across agent models |
| Behavior evidence | 13 fixture contracts, prior ten scenario desk reviews, and six executed Codex samples in `evaluation-results.md` | Statistical reliability or Claude/Cursor behavior |
| PR review | Passing checks, reviewed diff, clean base, no branch protection bypass | Product-owner approval of `main` |

The GitHub workflow `.github/workflows/validate-skills.yml` runs the repository validator and fixture-contract checks on PRs to `dev`/`main` and pushes to those branches with read-only token permissions. Actual agent runs are recorded in `docs/evaluation-results.md` and reviewed manually; CI does not claim model behavior success.

The quality gate is exercised against disposable copies: a broken reference, modified approved script, stale provenance table, and removed protected skill ID each fail for the expected reason. These mutation checks test detection, not skill behavior.

## Contributor quality bar

Every new engineering skill needs a narrow trigger and exclusions, a task workflow, explicit decision criteria, at least one realistic example, edge/failure cases, verification procedure, linked focused references, source provenance, license, and safe tool/environment boundaries. A short entrypoint is acceptable only when its references carry the depth and the entrypoint routes to them. Add a scenario to the evaluation file that would fail if the key guidance were removed. Record any unresolved version assumptions. Metadata validation alone is necessary but insufficient.

Preserve existing names/links when expanding an existing capability. Review script hashes and permissions before changing `registry/executables.tsv`. Do not run external code from a source repository solely to validate its prose. Recheck official product/API documentation for version-sensitive assertions at the time of adaptation.
