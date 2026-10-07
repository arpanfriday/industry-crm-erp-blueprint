# industry-crm-erp-blueprint

A single Claude skill that guides an industry-specific CRM-to-ERP integration blueprint (scope: CRM and ERP only).

## Layout

```
SKILL.md                 # 7-step workflow (loaded when triggered)
references/              # one file per industry + generic patterns (loaded on demand)
assets/                  # blueprint output template
evals/                   # evals.json + trigger-queries.json (not shipped in the zip)
tools/                   # validate.sh, package.sh
```

## Develop

1. Edit `SKILL.md` / `references/`.
2. `tools/validate.sh`
3. Test with the prompts in `evals/` (Anthropic's skill-creator can run the eval loop in Claude Code or Cowork).
4. `tools/package.sh` builds `dist/industry-crm-erp-blueprint.zip`.

## Install

- **Claude.ai (Team/Enterprise):** upload the zip under Settings (admins may also manage org-wide skill access). Verify current steps in the official docs.
- **Claude Code:** place the skill folder in `~/.claude/skills/` (personal) or `.claude/skills/` (project), or clone this repo there.

Docs: https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview
