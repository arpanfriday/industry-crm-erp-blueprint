# Consumer Goods and Manufacturing

> Starting points only. Confirm applicability and current versions via SKILL.md Step 0 before use.

## Compliance boundaries
- ASC 606 / IFRS 15: revenue recognition (rebates, returns, trade promotions as variable consideration)
- ASC 330 / IAS 2: inventory valuation
- SOX (public companies): change control and access over financial data
- GDPR / CCPA for consumer or retailer contact data
- Food and product traceability or safety rules where applicable (for example FSMA traceability, product safety regulators)
- Customs and trade documentation for cross-border shipments

## Operational drivers
- Inventory velocity / turns, days of inventory
- On-time-in-full (OTIF) and fill rate
- Gross margin by SKU / channel, trade-spend ROI
- Production yield, scrap, capacity utilization

## SSOT map
| Object | Owner |
|---|---|
| Accounts, retailers, opportunities, trade promotions | CRM (or TPM tool) |
| Item / BOM master, inventory, production orders, shipments, invoices, COGS | ERP |
| Customer master | Contested: recommend ERP for billing/ship-to, CRM for relationship |

## Data lifecycle
1. CRM: order or promotion agreed (Closed-Won / sales order)
2. ERP: sales order created, availability check, pick/pack/ship
3. ERP: invoice, revenue and COGS posted, inventory relieved
4. ERP -> CRM: order, shipment and invoice status; available-to-promise for the sales view
5. ERP: sales, margin and inventory summaries for reporting

## Sync pacing
- Order creation: real-time or near-real-time
- Inventory levels to CRM/sales view: hourly or daily
- Order, shipment and invoice status to CRM: near-real-time
- Ledger summaries: daily, with period-end final
- Promotion accruals: weekly or monthly batch

## Aggregation rules
- Source grain: invoice line / SKU / ship-to / day
- Target dimensions: product family x region x channel x month (plus entity, currency)
- Measures: net sales, volume, COGS, gross margin (sum); inventory (period-end balance, not sum)
- Reconcile to GL revenue and inventory accounts
