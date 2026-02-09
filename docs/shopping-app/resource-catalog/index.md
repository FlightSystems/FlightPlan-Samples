# Resource Catalog

> Resource index (one file per resource)

<details>
<summary>Metadata</summary>

- **Application:** Shopping Sample App
- **Version:** flightplan/v1
- **report:** resource-catalog
- **generated-by:** flightplan

</details>

---

## At a glance

This report is a detailed inventory of infrastructure resources. It is useful for audits, capacity planning, and operational ownership mapping. For service dependencies, see the Service Catalog report.

| Key | Value |
| --- | ----- |
| Application | Shopping Sample App |
| Resources | 3 |
| Services | 4 |
| Resource Dependencies | 4 |

## Resource Catalog

This is an index of resources. Each resource links to a separate detail page.

| Resource | Kind | Owner | Platform | Zone | Consumers | External Access |
| --- | --- | --- | --- | --- | --- | --- |
| [payment-gateway](payment-gateway.md) | external-service — Third-party or out-of-system dependency (SaaS/API/partner system). | backend | stripe/payments | external | 1 | No |
| [user-events-queue](user-events-queue.md) | queue — Point-to-point asynchronous messaging queue. | backend | aws/sqs | internal | 1 | No |
| [users-db](users-db.md) | database — Relational or document database used for durable storage. | backend | aws/rds-postgresql | restricted | 2 | No |

## Critical Resources

Critical resources are those with high fan-in (many services depend on them), cross-zone access, or external exposure. These warrant special attention for security, availability, and disaster recovery planning.

Criticality score is a heuristic: consumers + (2× cross-zone consumers) + (5× external access). Treat this as a review queue for security and reliability planning.

| Resource | Kind | Zone | Consumers | Cross-Zone | External | Score |
| --- | --- | --- | --- | --- | --- | --- |
| users-db | database — Relational or document database used for durable storage. | restricted | 2 | 1 | No | 4 |
| payment-gateway | external-service — Third-party or out-of-system dependency (SaaS/API/partner system). | external | 1 | 1 | No | 3 |
| user-events-queue | queue — Point-to-point asynchronous messaging queue. | internal | 1 | 1 | No | 3 |

## Hotspots

Resource hotspots are those with the highest number of service dependencies. These resources may benefit from optimization, caching, or architectural review.

| Resource | Kind | Zone | Total Uses | Unique Consumers |
| --- | --- | --- | --- | --- |
| users-db | database — Relational or document database used for durable storage. | restricted | 2 | 2 |
| payment-gateway | external-service — Third-party or out-of-system dependency (SaaS/API/partner system). | external | 1 | 1 |
| user-events-queue | queue — Point-to-point asynchronous messaging queue. | internal | 1 | 1 |

