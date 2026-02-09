# Service: users

> Service catalog detail

<details>
<summary>Metadata</summary>

- **Application:** Shopping Sample App
- **Version:** flightplan/v1
- **report:** service-catalog
- **generated-by:** flightplan
- **service:** users

</details>

---

## Service: users

Back to [Service Catalog](index.md).

Owner: api · Platform: dotnet · Zone: internal.

### Dependency graph

Inbound and outbound dependencies for this service.

```mermaid
flowchart LR
svc_users["users"]
res_users_db["resource: users-db (database)"]
svc_users -->|uses| res_users_db
svc_orders["orders"]
svc_orders -->|public-api| svc_users
svc_user_events_worker["user-events-worker"]
svc_user_events_worker -->|public-api| svc_users
svc_web_app["web-app"]
svc_web_app -->|public-api| svc_users
```

### Exports (1)

| Export | Protocol | Visibility | Auth | Consumers | Classifications |
| --- | --- | --- | --- | --- | --- |
| public-api | https — HTTP over TLS (standard for web APIs and browsers). | external — Callable by external consumers; treat as a primary ingress surface. | oauth2 — OAuth 2.0 (often with OIDC) for delegated authorization via access tokens. |  | personal_data |

### Outbound dependencies (1)

| Kind | Target | Export | Access | Details |
| --- | --- | --- | --- | --- |
| service-to-resource | users-db |  | read-write — Reads and writes data. | kind database |

### Inbound dependencies (3)

| Caller | Calls Export | Access | Details |
| --- | --- | --- | --- |
| orders | public-api |  | protocol https, external, auth oauth2 |
| user-events-worker | public-api |  | protocol https, external, auth oauth2 |
| web-app | public-api |  | protocol https, external, auth oauth2 |

