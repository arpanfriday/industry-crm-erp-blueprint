# Financial Services

> Starting points only. Confirm applicability and current versions via SKILL.md Step 0 before use.

## Compliance boundaries
- SOX (public companies); GLBA for consumer financial privacy
- PCI DSS where card data is stored, processed, or transmitted (prefer tokenization)
- BSA/AML and KYC obligations; sanctions screening
- SEC / FINRA recordkeeping (for example Rule 17a-4) for broker-dealers and advisers
- CECL (ASC 326), ASC 820 fair value, IFRS 9 where applicable; Basel capital rules for banks
- EU DORA and data residency rules where applicable

## Operational drivers
- AUM, net flows, fee revenue
- Net interest margin, deposit and loan growth
- Cost-to-income ratio, loss provisions
- Transaction and payment volumes, approval rates
- Client acquisition and retention (households, relationships)

## SSOT map
| Object | Owner |
|---|---|
| Prospects, relationships, advisor activity, onboarding status | CRM (with KYC/AML system as owner of compliance verdicts) |
| Accounts, balances, transactions | Core banking / trading / policy admin system |
| Corporate GL, AP/AR, fixed assets | ERP |

## Data lifecycle
1. CRM: client onboarded / product sold (after KYC clearance)
2. Core system: account opened, products activated
3. Core -> ERP: summarized postings to GL (revenue, fees, provisions)
4. ERP -> CRM: fee and billing status, relationship-level revenue summaries
5. ERP (+ core summaries): P&L and volume summaries for reporting

## Sync pacing
- Payments and card authorizations: real-time APIs
- KYC status to CRM: real-time or near-real-time
- Core postings to ERP GL: daily end-of-day batch
- Revenue summaries to CRM: daily / month-end final

## Aggregation rules
- Source grain: transaction / position / GL posting
- Target dimensions: product x segment x branch / region x month
- Measures: fees, interest, balances (average and period-end), volumes
- Tokenize or exclude card and account numbers before data leaves the core system
