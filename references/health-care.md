# Health Care

> Starting points only. Confirm applicability and current versions via SKILL.md Step 0 before use.

## Compliance boundaries
- HIPAA Privacy, Security, and Breach Notification Rules; HITECH; Business Associate Agreements with every vendor touching PHI
- 42 CFR Part 2 (substance use records) and state health privacy laws where applicable
- ASC 606 with ASC 954 (health care entities) for patient service revenue; ASC 958 for not-for-profits
- Payer and government billing rules (Medicare/Medicaid cost reporting, price transparency)
- SOX where public; minimum necessary standard for all data sharing

## Operational drivers
- Net patient revenue, payer mix
- Days in accounts receivable, denial rate, collection rate
- Case mix index, length of stay, volumes by service line
- Labor cost per adjusted occupied bed / FTE productivity
- Supply cost per case

## SSOT map
| Object | Owner |
|---|---|
| Patient demographics, encounters, clinical and charge data | EHR / practice management (outside the CRM/ERP integration) |
| Referral sources, physician relationships, patient engagement (non-clinical) | CRM, with PHI minimized |
| GL, payroll, supply chain, AP, actuals | ERP |

## Data lifecycle
1. CRM: referral or service agreement captured (non-clinical)
2. EHR: encounter and charges; billing and collections in PM/RCM system
3. ERP: summarized revenue, payroll, supply costs posted to GL
4. ERP -> CRM: non-clinical, aggregated status (for example contract and account standing)
5. ERP + EHR summary: de-identified volumes and revenue by service line for reporting

## Sync pacing
- Referral events: near-real-time or daily (watch PHI scope)
- Operational volumes: daily
- Financial actuals: daily / monthly batch
- Clinical events: handled in HL7/FHIR within the clinical domain, not in the CRM/ERP integration

## Aggregation rules
- Source grain: encounter / charge / GL line
- Target dimensions: service line x payer class x facility x month
- De-identify or aggregate before data reaches CRM or reporting; apply small-cell suppression
- Log and review access to any PHI-bearing hop
