---
name: industry-crm-erp-blueprint
description: Guides the design of an industry-specific data integration blueprint between CRM and ERP systems. Walks through industry vertical, compliance boundaries, operational drivers, system-of-record ownership, data lifecycle, sync frequency, and aggregation rules. Use this skill whenever the user asks about CRM-to-ERP integration, source of truth or system ownership between CRM and ERP, closed-won to order or contract flows, sync frequency, ERP transaction summarization, or integration design for TMT, Consumer Goods and Manufacturing, Life Sciences, Health Care, Real Estate and Construction, Professional Services, or Financial Services, even if they do not say "blueprint".
---

# Industry CRM-ERP Integration Blueprint

Scope: CRM and ERP only. Produce a vertical-specific integration design in seven ordered steps. Each step builds on the previous one. Do not skip ahead.

## Step 0: Verify against current official sources (always)

Never state regulatory requirements or vendor setup steps from memory. Industry reference files are **starting points only**.

1. Use web search / web fetch to confirm the current version and applicability of every standard or regulation named in Step 2 (for example HIPAA, ASC 606, IFRS 15) from official sources: standard setters, regulators, or government sites.
2. If the user names specific vendors, fetch that vendor's current official integration or API documentation before describing connector, API, or limit details.
3. Record each source URL for the Sources section of the output.
4. If web search/fetch is unavailable, state this plainly, mark all regulatory and vendor statements as "unverified", and ask the user to enable it or paste the relevant text.

## Step 1: Select the industry vertical

Ask the user to pick one (use the interactive options tool if available):

- Consumer Goods and Manufacturing
- TMT (technology, media, telecom)
- Life Sciences
- Health Care
- Real Estate | Construction
- Professional Services
- Financial Services

Then read the matching file. Read only that one:

| Industry | File |
|---|---|
| Consumer Goods and Manufacturing | `references/consumer-goods-manufacturing.md` |
| TMT | `references/tmt.md` |
| Life Sciences | `references/life-sciences.md` |
| Health Care | `references/health-care.md` |
| Real Estate / Construction | `references/real-estate-construction.md` |
| Professional Services | `references/professional-services.md` |
| Financial Services | `references/financial-services.md` |

If the user's business spans two verticals, choose the primary one and note the secondary as an overlay. If the industry is not listed, say so, ask for the closest fit, and use `references/generic-patterns.md` for gaps.

Also ask which CRM and ERP products are in play. If unknown, proceed with generic "CRM / ERP" labels.

## Step 2: Establish compliance boundaries

Use the industry file's "Compliance boundaries" section as the candidate list, then confirm each item in Step 0. For each applicable standard or regulation, state:

- What it governs (revenue recognition, privacy, security, record retention, and so on)
- The resulting requirement: data privacy, encryption (in transit and at rest), access control, audit trail
- Which systems and integration hops it touches

Flag items that apply only conditionally (for example HIPAA only where PHI is present) and ask the user to confirm the condition.

## Step 3: Isolate key operational drivers

From "Operational drivers" in the industry file, select the 3-5 metrics that matter most for this client. For each, name the source system and which system or report consumes it. Ask the user to confirm or swap metrics. These drivers decide what must be integrated and at what grain.

## Step 4: Map system ownership (single source of truth)

Build an SSOT table: one owning system per critical data object. Start from "SSOT map" in the industry file. Default principle: CRM owns client prospects and pipeline; ERP owns transactional actuals. Rules:

- Exactly one owner per data object. The other system holds a read-only copy.
- State the key used to join records across systems (customer ID, contract ID, project ID).
- Call out contested objects (for example customer master, product master) and recommend an owner with rationale.

## Step 5: Trace the data lifecycle

Chart the chronological flow of information between the two systems, using "Data lifecycle" in the industry file as the template. Number each hop: trigger event, source system, target system, payload, resulting action. The core chain is: CRM event (for example Closed-Won) -> ERP action (for example order fulfilment or contract setup) -> ERP actuals -> summarized status back to CRM. Include failure handling at each hop (retry, dead-letter, reconciliation owner).

## Step 6: Determine sync pacing

Assign a frequency to each hop from Step 5. Decision rule:

- Real-time API or event: the downstream action is time-critical or customer-visible (for example card processing, order confirmation).
- Near-real-time or hourly: operational data that teams watch intraday.
- Scheduled batch (daily / period-end): aggregate ledger data where completeness and reconciliation matter more than speed.

Justify each choice in one line. Use "Sync pacing" in the industry file as the starting point and `references/generic-patterns.md` for the decision table and reliability controls.

## Step 7: Design data aggregation rules

Define how high-volume ERP line-item transactions are condensed into structured, dimensional summaries (for CRM account views and reporting). For each summary specify: source grain, target dimensions, measures and the aggregation function, mapping tables, currency and period handling, and a reconciliation check back to the ERP trial balance. Start from "Aggregation rules" in the industry file.

## Output

Deliver the blueprint using `assets/blueprint-template.md` as the structure. Keep it concise, use tables for the SSOT map, lifecycle, and sync pacing, and end with open questions and the Sources list from Step 0.

## Working style

- Ask for confirmation at the end of Steps 1, 3, and 4. These choices cascade.
- When the user's answer conflicts with the industry file, follow the user and note the deviation.
- Do not invent vendor features. Unknown means "verify with vendor docs".
