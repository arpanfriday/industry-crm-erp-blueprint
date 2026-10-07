# Generic patterns (use to fill gaps in industry files)

## Contents
- Sync pattern decision table
- Reliability controls
- Aggregation checklist

## Sync pattern decision table
| Situation | Pattern |
|---|---|
| Customer-visible or revenue-impacting trigger | Real-time API or event |
| Operational data watched intraday | Near-real-time (minutes to hourly) |
| Large volumes, needs completeness and reconciliation | Scheduled batch (daily / period-end) |
| Source system has strict API limits | Batch or queue with throttling (verify limits in vendor docs) |

## Reliability controls
- Idempotent writes using a stable external ID per record
- Retry with backoff; dead-letter queue with a named owner
- Reconciliation report per hop (record counts and control totals)
- Audit log of who/what changed a record and when
- Secrets in a vault; least-privilege integration users; TLS in transit; encryption at rest

## Aggregation checklist
- Source grain and target grain stated
- Account / category mapping table versioned and owned by Finance
- Currency: transaction, functional, and reporting currencies; rate source and date
- Period handling: calendar vs fiscal; late-posted and reversing entries
- Reconciles to ERP trial balance within agreed tolerance
