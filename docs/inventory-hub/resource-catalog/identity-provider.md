# Resource: identity-provider

> Resource catalog detail

<details>
<summary>Metadata</summary>

- **Application:** Inventory Hub
- **Version:** flightplan/v1
- **report:** resource-catalog
- **generated-by:** flightplan
- **resource:** identity-provider

</details>

---

## Resource: identity-provider

Back to [Resource Catalog](index.md).

Kind: external-service · Owner: api · Platform: auth0 · Zone: external.

### Dependency graph

Services that depend on this resource.

```mermaid
flowchart LR
res_identity_provider["identity-provider<br/>external-service"]
svc_admin_portal["admin-portal"]
svc_admin_portal -->|read| res_identity_provider
```

### Consumers (1)

| Service | Access | Details |
| --- | --- | --- |
| admin-portal | read — Reads data but does not modify it. | cross-zone (service in public, resource in external) |

