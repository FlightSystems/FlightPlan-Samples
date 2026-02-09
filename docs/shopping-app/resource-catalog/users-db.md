# Resource: users-db

> Resource catalog detail

<details>
<summary>Metadata</summary>

- **Application:** Shopping Sample App
- **Version:** flightplan/v1
- **report:** resource-catalog
- **generated-by:** flightplan
- **resource:** users-db

</details>

---

## Resource: users-db

Back to [Resource Catalog](index.md).

Kind: database · Owner: backend · Platform: aws/rds-postgresql · Zone: restricted.

### Dependency graph

Services that depend on this resource.

```mermaid
flowchart LR
res_users_db["users-db<br/>database"]
svc_user_events_worker["user-events-worker"]
svc_user_events_worker -->|read| res_users_db
svc_users["users"]
svc_users -->|read-write| res_users_db
```

### Consumers (2)

| Service | Access | Details |
| --- | --- | --- |
| user-events-worker | read — Reads data but does not modify it. |  |
| users | read-write — Reads and writes data. | cross-zone (service in internal, resource in restricted) |

