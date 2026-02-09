# Service: catalog

> Service catalog detail

<details>
<summary>Metadata</summary>

- **Application:** Inventory Hub
- **Version:** flightplan/v1
- **report:** service-catalog
- **generated-by:** flightplan
- **service:** catalog

</details>

---

## Service: catalog

Back to [Service Catalog](index.md).

Owner: api · Platform: dotnet · Zone: internal.

### Dependency graph

Inbound and outbound dependencies for this service.

```mermaid
flowchart LR
svc_catalog["catalog"]
res_audit_log_bucket["resource: audit-log-bucket (object-storage)"]
svc_catalog -->|uses| res_audit_log_bucket
res_catalog_db["resource: catalog-db (database)"]
svc_catalog -->|uses| res_catalog_db
svc_admin_portal["admin-portal"]
svc_admin_portal -->|internal-api| svc_catalog
svc_inventory["inventory"]
svc_inventory -->|public-api| svc_catalog
```

### Exports (2)

| Export | Protocol | Visibility | Auth | Consumers | Classifications |
| --- | --- | --- | --- | --- | --- |
| internal-api | https — HTTP over TLS (standard for web APIs and browsers). | internal — Intended only for internal callers within the organization/system boundary. | oauth2 — OAuth 2.0 (often with OIDC) for delegated authorization via access tokens. |  | confidential_business_data |
| public-api | https — HTTP over TLS (standard for web APIs and browsers). | external — Callable by external consumers; treat as a primary ingress surface. | oauth2 — OAuth 2.0 (often with OIDC) for delegated authorization via access tokens. |  | confidential_business_data, public |

### Outbound dependencies (2)

| Kind | Target | Export | Access | Details |
| --- | --- | --- | --- | --- |
| service-to-resource | audit-log-bucket |  | write — Writes or modifies data. | kind object-storage |
| service-to-resource | catalog-db |  | read-write — Reads and writes data. | kind database |

### Inbound dependencies (2)

| Caller | Calls Export | Access | Details |
| --- | --- | --- | --- |
| admin-portal | internal-api |  | protocol https, internal, auth oauth2 |
| inventory | public-api |  | protocol https, external, auth oauth2 |

