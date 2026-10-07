# Life Sciences

> Starting points only. Confirm applicability and current versions via SKILL.md Step 0 before use.

## Compliance boundaries
- FDA 21 CFR Part 11 and GxP: electronic records, signatures, validation, audit trails
- HIPAA: usually only where PHI is handled (for example patient support programs); confirm
- Open Payments / Sunshine Act (US) and EU transparency rules for HCP interactions
- Supply chain serialization (for example DSCSA in the US)
- ASC 606 / IFRS 15 including gross-to-net (rebates, chargebacks, returns); ASC 730 for R&D
- GDPR / local privacy laws for HCP and patient data

## Operational drivers
- Gross-to-net and net revenue by product
- R&D spend by program and phase
- Batch yield, release cycle time
- Field force effectiveness and HCP engagement

## SSOT map
| Object | Owner |
|---|---|
| HCP / HCO records, call activity, samples, consent | CRM (life-sciences CRM) |
| Lots / batches, inventory, orders, GTN accruals, R&D actuals, GL | ERP |
| Patient-level data | Segregated system; keep out of CRM/ERP integration unless contractually and legally required |

## Data lifecycle
1. CRM: HCP/HCO order or contract (for example wholesaler or institution)
2. ERP: order fulfilment from released lots; serialization data captured
3. ERP: invoice, GTN accruals (rebates, chargebacks), revenue
4. ERP -> CRM: order, shipment and invoice status for account teams
5. ERP: net revenue, accrual and program-level R&D cost summaries for reporting

## Sync pacing
- HCP interaction data: daily batch
- Orders and lot allocation: near-real-time
- GTN accruals: monthly (with weekly estimates)
- R&D actuals: monthly batch

## Aggregation rules
- Source grain: invoice line / lot / project cost line
- Target dimensions: product x channel x region x month; program x phase x cost type x quarter
- Measures: gross sales, GTN deductions, net sales (sum); R&D cost (sum)
- Validated integrations must retain audit trail and change control
