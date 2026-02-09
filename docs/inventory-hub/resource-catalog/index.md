# Resource Catalog

> Resource index (one file per resource)

<details>
<summary>Metadata</summary>

- **Application:** Inventory Hub
- **Version:** flightplan/v1
- **report:** resource-catalog
- **generated-by:** flightplan

</details>

---

## At a glance

This report is a detailed inventory of infrastructure resources. It is useful for audits, capacity planning, and operational ownership mapping. For service dependencies, see the Service Catalog report.

| Key | Value |
| --- | ----- |
| Application | Inventory Hub |
| Resources | 5 |
| Services | 5 |
| Resource Dependencies | 9 |

## Resource Catalog

This is an index of resources. Each resource links to a separate detail page.

| Resource | Kind | Owner | Platform | Zone | Consumers | External Access |
| --- | --- | --- | --- | --- | --- | --- |
| [audit-log-bucket](audit-log-bucket.md) | object-storage — Blob/object storage for files and large unstructured data. | backend | aws/s3 | restricted | 3 | No |
| [catalog-db](catalog-db.md) | database — Relational or document database used for durable storage. | backend | aws/rds-postgresql | restricted | 1 | No |
| [identity-provider](identity-provider.md) | external-service — Third-party or out-of-system dependency (SaaS/API/partner system). | api | auth0 | external | 1 | No |
| [inventory-db](inventory-db.md) | database — Relational or document database used for durable storage. | backend | aws/rds-postgresql | restricted | 2 | No |
| [inventory-events-topic](inventory-events-topic.md) | topic — Publish/subscribe channel for messages or events. | backend | aws/sns | internal | 2 | No |

## Critical Resources

Critical resources are those with high fan-in (many services depend on them), cross-zone access, or external exposure. These warrant special attention for security, availability, and disaster recovery planning.

Criticality score is a heuristic: consumers + (2× cross-zone consumers) + (5× external access). Treat this as a review queue for security and reliability planning.

| Resource | Kind | Zone | Consumers | Cross-Zone | External | Score |
| --- | --- | --- | --- | --- | --- | --- |
| audit-log-bucket | object-storage — Blob/object storage for files and large unstructured data. | restricted | 3 | 2 | No | 7 |
| inventory-db | database — Relational or document database used for durable storage. | restricted | 2 | 1 | No | 4 |
| inventory-events-topic | topic — Publish/subscribe channel for messages or events. | internal | 2 | 1 | No | 4 |
| catalog-db | database — Relational or document database used for durable storage. | restricted | 1 | 1 | No | 3 |
| identity-provider | external-service — Third-party or out-of-system dependency (SaaS/API/partner system). | external | 1 | 1 | No | 3 |

## Hotspots

Resource hotspots are those with the highest number of service dependencies. These resources may benefit from optimization, caching, or architectural review.

| Resource | Kind | Zone | Total Uses | Unique Consumers |
| --- | --- | --- | --- | --- |
| audit-log-bucket | object-storage — Blob/object storage for files and large unstructured data. | restricted | 3 | 3 |
| inventory-db | database — Relational or document database used for durable storage. | restricted | 2 | 2 |
| inventory-events-topic | topic — Publish/subscribe channel for messages or events. | internal | 2 | 2 |
| catalog-db | database — Relational or document database used for durable storage. | restricted | 1 | 1 |
| identity-provider | external-service — Third-party or out-of-system dependency (SaaS/API/partner system). | external | 1 | 1 |

