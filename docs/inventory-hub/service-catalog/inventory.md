# Service: inventory

> Service catalog detail

<details>
<summary>Metadata</summary>

- **Application:** Inventory Hub
- **Version:** flightplan/v1
- **report:** service-catalog
- **generated-by:** flightplan
- **service:** inventory

</details>

---

## Service: inventory

Back to [Service Catalog](index.md).

Owner: api · Platform: dotnet · Zone: internal.

### Dependency graph

Inbound and outbound dependencies for this service.

```mermaid
flowchart LR
svc_inventory["inventory"]
res_audit_log_bucket["resource: audit-log-bucket (object-storage)"]
svc_inventory -->|uses| res_audit_log_bucket
res_inventory_db["resource: inventory-db (database)"]
svc_inventory -->|uses| res_inventory_db
res_inventory_events_topic["resource: inventory-events-topic (topic)"]
svc_inventory -->|uses| res_inventory_events_topic
svc_catalog["catalog"]
svc_inventory -->|public-api| svc_catalog
svc_admin_portal["admin-portal"]
svc_admin_portal -->|public-api| svc_inventory
svc_inventory_legacy_sync["inventory-legacy-sync"]
svc_inventory_legacy_sync -->|public-api| svc_inventory
```

### Exports (1)

| Export | Protocol | Visibility | Auth | Consumers | Classifications |
| --- | --- | --- | --- | --- | --- |
| public-api | https — HTTP over TLS (standard for web APIs and browsers). | external — Callable by external consumers; treat as a primary ingress surface. | oauth2 — OAuth 2.0 (often with OIDC) for delegated authorization via access tokens. |  | confidential_business_data, system_metadata |

### Outbound dependencies (4)

| Kind | Target | Export | Access | Details |
| --- | --- | --- | --- | --- |
| service-to-resource | audit-log-bucket |  | write — Writes or modifies data. | kind object-storage |
| service-to-resource | inventory-db |  | read-write — Reads and writes data. | kind database |
| service-to-resource | inventory-events-topic |  | write — Writes or modifies data. | kind topic |
| service-to-service | catalog | public-api |  | protocol https, external, auth oauth2 |

### Inbound dependencies (2)

| Caller | Calls Export | Access | Details |
| --- | --- | --- | --- |
| admin-portal | public-api |  | protocol https, external, auth oauth2 |
| inventory-legacy-sync | public-api |  | protocol https, external, auth oauth2 |

