# Resource: catalog-db

> Resource catalog detail

<details>
<summary>Metadata</summary>

- **Application:** Inventory Hub
- **Version:** flightplan/v1
- **report:** resource-catalog
- **generated-by:** flightplan
- **resource:** catalog-db

</details>

---

## Resource: catalog-db

Back to [Resource Catalog](index.md).

Kind: database · Owner: backend · Platform: aws/rds-postgresql · Zone: restricted.

### Dependency graph

Services that depend on this resource.

```mermaid
flowchart LR
res_catalog_db["catalog-db<br/>database"]
svc_catalog["catalog"]
svc_catalog -->|read-write| res_catalog_db
```

### Consumers (1)

| Service | Access | Details |
| --- | --- | --- |
| catalog | read-write — Reads and writes data. | cross-zone (service in internal, resource in restricted) |

