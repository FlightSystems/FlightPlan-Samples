# Service: admin-portal

> Service catalog detail

<details>
<summary>Metadata</summary>

- **Application:** Inventory Hub
- **Version:** flightplan/v1
- **report:** service-catalog
- **generated-by:** flightplan
- **service:** admin-portal

</details>

---

## Service: admin-portal

Back to [Service Catalog](index.md).

Owner: frontend · Platform: react · Zone: public.

### Dependency graph

Inbound and outbound dependencies for this service.

```mermaid
flowchart LR
svc_admin_portal["admin-portal"]
res_identity_provider["resource: identity-provider (external-service)"]
svc_admin_portal -->|uses| res_identity_provider
svc_catalog["catalog"]
svc_admin_portal -->|internal-api| svc_catalog
svc_inventory["inventory"]
svc_admin_portal -->|public-api| svc_inventory
```

### Exports (0)

None.

### Outbound dependencies (3)

| Kind | Target | Export | Access | Details |
| --- | --- | --- | --- | --- |
| service-to-resource | identity-provider |  | read — Reads data but does not modify it. | kind external-service |
| service-to-service | catalog | internal-api |  | protocol https, internal, auth oauth2 |
| service-to-service | inventory | public-api |  | protocol https, external, auth oauth2 |

### Inbound dependencies (0)

None.

