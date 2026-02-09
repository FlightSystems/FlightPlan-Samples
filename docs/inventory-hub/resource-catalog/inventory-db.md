# Resource: inventory-db

> Resource catalog detail

<details>
<summary>Metadata</summary>

- **Application:** Inventory Hub
- **Version:** flightplan/v1
- **report:** resource-catalog
- **generated-by:** flightplan
- **resource:** inventory-db

</details>

---

## Resource: inventory-db

Back to [Resource Catalog](index.md).

Kind: database · Owner: backend · Platform: aws/rds-postgresql · Zone: restricted.

### Dependency graph

Services that depend on this resource.

```mermaid
flowchart LR
res_inventory_db["inventory-db<br/>database"]
svc_inventory["inventory"]
svc_inventory -->|read-write| res_inventory_db
svc_inventory_events_worker["inventory-events-worker"]
svc_inventory_events_worker -->|read| res_inventory_db
```

### Consumers (2)

| Service | Access | Details |
| --- | --- | --- |
| inventory | read-write — Reads and writes data. | cross-zone (service in internal, resource in restricted) |
| inventory-events-worker | read — Reads data but does not modify it. |  |

