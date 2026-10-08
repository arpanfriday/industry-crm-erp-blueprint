# CLAUDE.md

## Project overview
`industry-crm-erp-blueprint` is a single Claude skill (not an app) that guides an industry-specific CRM-to-ERP integration blueprint. Scope is CRM and ERP only; out-of-scope topics (e.g. CPM) should not appear in skill content.

The skill runs a Step 0 verification plus 7 ordered steps (industry, compliance, drivers, system ownership, data lifecycle, sync pacing, aggregation) and produces output from `assets/blueprint-template.md`.

## Layout
- `SKILL.md`: the skill itself (frontmatter + workflow). Keep under 500 lines.
- `references/`: one file per industry (`consumer-goods-manufacturing`, `tmt`, `life-sciences`, `health-care`, `real-estate-construction`, `professional-services`, `financial-services`) plus `generic-patterns.md`. Loaded on demand; only the selected industry is read.
- `assets/blueprint-template.md`: output template.
- `evals/`: `evals.json` (test prompts and expectations) and `trigger-queries.json` (should/shouldn't-trigger queries). Not shipped in the zip.
- `tools/`: `validate.sh`, `package.sh`.

## Conventions
- Frontmatter `name` must equal the repo folder name (`industry-crm-erp-blueprint`); `description` is the trigger text, so keep it accurate when scope changes.
- Reference files are starting points only. Never hardcode regulatory or vendor claims as verified; SKILL.md Step 0 requires checking current official sources and recording URLs.
- Any file referenced from `SKILL.md` in backticks (`references/...`, `assets/...`) must exist.
- Adding an industry means: new `references/<industry>.md`, a row in the SKILL.md Step 1 list and table, and new evals plus trigger queries.
- Changing the workflow or description means updating `evals/` to match.

## Common commands
```bash
bash tools/validate.sh   # frontmatter, name/folder match, <500 lines, evals exist, linked refs exist
bash tools/package.sh    # builds dist/industry-crm-erp-blueprint.zip (gitignored)
```
There is no build or test suite beyond `validate.sh`. Behavior is tested by running the prompts in `evals/` (e.g. with Anthropic's skill-creator).

## Session workflow
Read `NOTES.md` at the start of every session for current status and decisions. Before ending a session, update `NOTES.md` (see the instructions at its top).
