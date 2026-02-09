# Service: inventory-events-worker

> Service catalog detail

<details>
<summary>Metadata</summary>

- **Application:** Inventory Hub
- **Version:** flightplan/v1
- **report:** service-catalog
- **generated-by:** flightplan
- **service:** inventory-events-worker

</details>

---

## Service: inventory-events-worker

Back to [Service Catalog](index.md).

Owner: backend · Platform: python · Zone: restricted.

### Dependency graph

Inbound and outbound dependencies for this service.

```mermaid
flowchart LR
svc_inventory_events_worker["inventory-events-worker"]
res_audit_log_bucket["resource: audit-log-bucket (object-storage)"]
svc_inventory_events_worker -->|uses| res_audit_log_bucket
res_inventory_db["resource: inventory-db (database)"]
svc_inventory_events_worker -->|uses| res_inventory_db
res_inventory_events_topic["resource: inventory-events-topic (topic)"]
svc_inventory_events_worker -->|uses| res_inventory_events_topic
```

### Exports (0)

None.

### Outbound dependencies (3)

| Kind | Target | Export | Access | Details |
| --- | --- | --- | --- | --- |
| service-to-resource | audit-log-bucket |  | read-write — Reads and writes data. | kind object-storage |
| service-to-resource | inventory-db |  | read — Reads data but does not modify it. | kind database |
| service-to-resource | inventory-events-topic |  | read — Reads data but does not modify it. | kind topic |

### Inbound dependencies (0)

None.

