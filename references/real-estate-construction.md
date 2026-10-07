# Real Estate | Construction

> Starting points only. Confirm applicability and current versions via SKILL.md Step 0 before use.

## Compliance boundaries
- ASC 606 / IFRS 15: over-time recognition, typically cost-to-cost percent complete; contract modifications
- ASC 842 / IFRS 16: leases (lessor and lessee); real estate guidance (for example ASC 360, ASC 970)
- Retainage, progress billing, lien waiver and prevailing-wage requirements
- Surety / bonding and lender reporting covenants
- SOX where public; privacy laws for tenant and buyer data

## Operational drivers
- Backlog and WIP schedule (over/under billings)
- Gross margin and cost-to-complete by job
- Percent complete, change-order volume
- Real estate: NOI, occupancy, lease expirations, same-store growth
- DSO including retainage

## SSOT map
| Object | Owner |
|---|---|
| Bids, prospects, tenant / buyer leads, opportunities | CRM |
| Contracts, commitments, change orders, job cost, billings, leases, GL | ERP / job-cost system |
| Field progress and timesheets | Field / project management tool, feeding ERP |

## Data lifecycle
1. CRM: bid won or lease signed
2. ERP: project / lease created with budget, cost codes, billing schedule
3. ERP: commitments, change orders, job cost, progress billing and revenue
4. ERP -> CRM: project status, billing and payment status for account managers
5. ERP: cost, billing and percent-complete summaries by project for reporting

## Sync pacing
- Bid won to project setup: near-real-time
- Field time and quantities: daily
- Job cost and WIP summaries: monthly batch (aligned to close)
- Lease and rent roll: monthly

## Aggregation rules
- Source grain: cost-code line / commitment / billing line
- Target dimensions: project x phase x cost type x month (and entity / region)
- Measures: cost, billings, revenue (sum); percent complete (computed, not summed)
- Reconcile WIP schedule to GL contract assets/liabilities
