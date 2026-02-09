# Resource: inventory-events-topic

> Resource catalog detail

<details>
<summary>Metadata</summary>

- **Application:** Inventory Hub
- **Version:** flightplan/v1
- **report:** resource-catalog
- **generated-by:** flightplan
- **resource:** inventory-events-topic

</details>

---

## Resource: inventory-events-topic

Back to [Resource Catalog](index.md).

Kind: topic · Owner: backend · Platform: aws/sns · Zone: internal.

### Dependency graph

Services that depend on this resource.

```mermaid
flowchart LR
res_inventory_events_topic["inventory-events-topic<br/>topic"]
svc_inventory["inventory"]
svc_inventory -->|write| res_inventory_events_topic
svc_inventory_events_worker["inventory-events-worker"]
svc_inventory_events_worker -->|read| res_inventory_events_topic
```

### Consumers (2)

| Service | Access | Details |
| --- | --- | --- |
| inventory | write — Writes or modifies data. |  |
| inventory-events-worker | read — Reads data but does not modify it. | cross-zone (service in restricted, resource in internal) |

