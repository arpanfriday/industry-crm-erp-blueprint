# TMT (Technology, Media, Telecom)

> Starting points only. Confirm applicability and current versions via SKILL.md Step 0 before use.

## Compliance boundaries
- ASC 606 / IFRS 15: multi-element arrangements, subscriptions, usage, licenses
- ASC 340-40: capitalization and amortization of contract acquisition costs (commissions)
- SOX (public companies)
- GDPR / CCPA for user and subscriber data
- SOC 2 / ISO 27001 expectations from enterprise customers
- Sector rules: telecom subscriber data (for example CPNI in the US), media rights and royalty obligations

## Operational drivers
- ARR / MRR and the ARR waterfall (new, expansion, contraction, churn)
- Net revenue retention, logo churn
- CAC, LTV, payback period
- ARPU (telecom), content cost and royalties (media)
- Billings, deferred revenue, RPO / backlog

## SSOT map
| Object | Owner |
|---|---|
| Leads, accounts, opportunities, quotes | CRM |
| Subscriptions as billed, invoices, rev-rec schedules, deferred revenue, GL | ERP / billing |
| Usage records | Metering / billing system, summarized to ERP |

## Data lifecycle
1. CRM: opportunity Closed-Won with approved quote
2. ERP / billing: customer, contract, subscription and rev-rec schedule created
3. ERP: invoices issued; usage rated; revenue and deferred revenue posted
4. ERP -> CRM: contract, invoice and payment status; renewal dates; ARR snapshot for sales and customer success
5. ERP: billings, revenue and deferred revenue summaries for reporting

## Sync pacing
- Closed-Won to contract creation: real-time or near-real-time event
- Usage rating: hourly or daily
- Subscription and payment status to CRM: near-real-time or daily
- Ledger summaries: daily with period-end final

## Aggregation rules
- Source grain: subscription line / invoice line / usage record
- Target dimensions: customer segment x product x region x month
- Measures: ARR movement categories (sum), revenue (sum), deferred revenue (period-end balance)
- Reconcile ARR to contracts and revenue to GL
