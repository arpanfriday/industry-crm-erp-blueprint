# NOTES.md: cross-session progress log

Shared context for Claude Code across sessions and machines. **Before ending a session, update this file**: move finished items to Done, refresh In progress and Next, and append any new decisions (with date and reason). Keep entries short and factual; commit it with the related changes.

Last updated: 2026-10-11

## Done
- Skill scaffold: `SKILL.md` (Step 0 + 7 steps), 7 industry reference files, `generic-patterns.md`, output template.
- 5 evals in `evals/evals.json` and trigger queries in `evals/trigger-queries.json`.
- Tooling: `tools/validate.sh`, `tools/package.sh`.
- `CLAUDE.md` and `NOTES.md` added (2026-10-08).
- 2026-10-11: Rewrote confirmation questions in SKILL.md Steps 1, 3 and 4 so a newcomer can answer them (plain-language definition, proposed items shown with rationale, outcome-describing options). Trigger: a Claude.ai test showed the Step 3 drivers question was unclear.
- 2026-10-11: Added eval 6 (newcomer clarity of the Step 1/3/4 questions).

## In progress
- Nothing.

## Next / ideas
- Rebuild the zip, re-upload to Claude.ai, and rerun eval 6 (and the rest) there; record results here. Not yet run since the Step 1/3/4 rewrite.
- Confirm `tools/validate.sh` passes after any SKILL.md or references change.

## Key decisions
- Scope is CRM and ERP only; CPM is out of scope (validate.sh warns on mentions).
- Reference files are starting points; regulatory and vendor facts must be verified from official sources at run time (SKILL.md Step 0).
- Only the selected industry's reference file is loaded, to keep context small.
- `evals/`, `tools/` and `README.md` are excluded from the packaged zip.

- Confirmation questions must be self-contained: define the term, name the items in the question, and make options say what happens. Industry file is the only source for suggested extra metrics unless labelled as an addition.
- Target runtime for manual testing is Claude.ai chat (zip upload), not Claude Code. `tools/*.sh` are not executable; run with `bash`.

## Open questions
- None.
