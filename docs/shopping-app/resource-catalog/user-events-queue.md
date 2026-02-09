# Resource: user-events-queue

> Resource catalog detail

<details>
<summary>Metadata</summary>

- **Application:** Shopping Sample App
- **Version:** flightplan/v1
- **report:** resource-catalog
- **generated-by:** flightplan
- **resource:** user-events-queue

</details>

---

## Resource: user-events-queue

Back to [Resource Catalog](index.md).

Kind: queue · Owner: backend · Platform: aws/sqs · Zone: internal.

### Dependency graph

Services that depend on this resource.

```mermaid
flowchart LR
res_user_events_queue["user-events-queue<br/>queue"]
svc_user_events_worker["user-events-worker"]
svc_user_events_worker -->|read| res_user_events_queue
```

### Consumers (1)

| Service | Access | Details |
| --- | --- | --- |
| user-events-worker | read — Reads data but does not modify it. | cross-zone (service in restricted, resource in internal) |

