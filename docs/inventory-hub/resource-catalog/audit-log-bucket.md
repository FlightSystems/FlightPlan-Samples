# Resource: audit-log-bucket

> Resource catalog detail

<details>
<summary>Metadata</summary>

- **Application:** Inventory Hub
- **Version:** flightplan/v1
- **report:** resource-catalog
- **generated-by:** flightplan
- **resource:** audit-log-bucket

</details>

---

## Resource: audit-log-bucket

Back to [Resource Catalog](index.md).

Kind: object-storage · Owner: backend · Platform: aws/s3 · Zone: restricted.

### Dependency graph

Services that depend on this resource.

```mermaid
flowchart LR
res_audit_log_bucket["audit-log-bucket<br/>object-storage"]
svc_catalog["catalog"]
svc_catalog -->|write| res_audit_log_bucket
svc_inventory["inventory"]
svc_inventory -->|write| res_audit_log_bucket
svc_inventory_events_worker["inventory-events-worker"]
svc_inventory_events_worker -->|read-write| res_audit_log_bucket
```

### Consumers (3)

| Service | Access | Details |
| --- | --- | --- |
| catalog | write — Writes or modifies data. | cross-zone (service in internal, resource in restricted) |
| inventory | write — Writes or modifies data. | cross-zone (service in internal, resource in restricted) |
| inventory-events-worker | read-write — Reads and writes data. |  |

