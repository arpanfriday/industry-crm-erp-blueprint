# NOTES.md: cross-session progress log

Shared context for Claude Code across sessions and machines. **Before ending a session, update this file**: move finished items to Done, refresh In progress and Next, and append any new decisions (with date and reason). Keep entries short and factual; commit it with the related changes.

Last updated: 2026-10-08

## Done
- Skill scaffold: `SKILL.md` (Step 0 + 7 steps), 7 industry reference files, `generic-patterns.md`, output template.
- 5 evals in `evals/evals.json` and trigger queries in `evals/trigger-queries.json`.
- Tooling: `tools/validate.sh`, `tools/package.sh`.
- `CLAUDE.md` and `NOTES.md` added (2026-10-08).

## In progress
- Nothing.

## Next / ideas
- Run the eval loop and record results here.
- Confirm `tools/validate.sh` passes after any SKILL.md or references change.

## Key decisions
- Scope is CRM and ERP only; CPM is out of scope (validate.sh warns on mentions).
- Reference files are starting points; regulatory and vendor facts must be verified from official sources at run time (SKILL.md Step 0).
- Only the selected industry's reference file is loaded, to keep context small.
- `evals/`, `tools/` and `README.md` are excluded from the packaged zip.

## Open questions
- None.
