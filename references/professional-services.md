# Professional Services

> Starting points only. Confirm applicability and current versions via SKILL.md Step 0 before use.

## Compliance boundaries
- ASC 606 / IFRS 15: time-and-materials, fixed fee, milestone, and retainer arrangements
- Client confidentiality and contractual data-handling terms
- GDPR / CCPA for personnel and client contact data
- Independence and professional standards where the firm is an audit or regulated advisory firm
- SOX where public; payroll and labor regulations for time tracking

## Operational drivers
- Utilization (billable and target)
- Realization and bill-rate attainment
- Backlog and pipeline coverage
- Revenue per head, pyramid / leverage
- WIP and DSO, win rate

## SSOT map
| Object | Owner |
|---|---|
| Accounts, opportunities, proposals | CRM |
| Projects, resource assignments, time and expense, billing, GL | PSA / ERP |
| Employees, rates, cost rates | HRIS (feeds PSA/ERP) |

## Data lifecycle
1. CRM: engagement Closed-Won
2. PSA / ERP: client, project, budget, rate card and staffing created
3. PSA / ERP: time and expenses captured, invoices issued, revenue recognized
4. ERP -> CRM: project, billing and payment status; revenue-to-date by client
5. ERP: hours, revenue and cost summaries by practice and role for reporting

## Sync pacing
- Closed-Won to project creation: real-time or near-real-time
- Time entries: daily
- Revenue and cost actuals: daily / monthly close
- Billing and payment status to CRM: daily

## Aggregation rules
- Source grain: time entry / expense line / invoice line
- Target dimensions: practice x role / level x client x month
- Measures: hours (billable, non-billable), revenue, cost (sum); utilization and realization (ratios computed after aggregation)
- Reconcile revenue and WIP to GL
