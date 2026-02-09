# Service: user-events-worker

> Service catalog detail

<details>
<summary>Metadata</summary>

- **Application:** Shopping Sample App
- **Version:** flightplan/v1
- **report:** service-catalog
- **generated-by:** flightplan
- **service:** user-events-worker

</details>

---

## Service: user-events-worker

Back to [Service Catalog](index.md).

Owner: backend · Platform: python · Zone: restricted.

### Dependency graph

Inbound and outbound dependencies for this service.

```mermaid
flowchart LR
svc_user_events_worker["user-events-worker"]
res_user_events_queue["resource: user-events-queue (queue)"]
svc_user_events_worker -->|uses| res_user_events_queue
res_users_db["resource: users-db (database)"]
svc_user_events_worker -->|uses| res_users_db
svc_users["users"]
svc_user_events_worker -->|public-api| svc_users
```

### Exports (0)

None.

### Outbound dependencies (3)

| Kind | Target | Export | Access | Details |
| --- | --- | --- | --- | --- |
| service-to-resource | user-events-queue |  | read — Reads data but does not modify it. | kind queue |
| service-to-resource | users-db |  | read — Reads data but does not modify it. | kind database |
| service-to-service | users | public-api |  | protocol https, external, auth oauth2 |

### Inbound dependencies (0)

None.

