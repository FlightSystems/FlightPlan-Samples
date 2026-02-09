# Service: web-app

> Service catalog detail

<details>
<summary>Metadata</summary>

- **Application:** Shopping Sample App
- **Version:** flightplan/v1
- **report:** service-catalog
- **generated-by:** flightplan
- **service:** web-app

</details>

---

## Service: web-app

Back to [Service Catalog](index.md).

Owner: frontend · Platform: vue/3 · Zone: public.

### Dependency graph

Inbound and outbound dependencies for this service.

```mermaid
flowchart LR
svc_web_app["web-app"]
svc_orders["orders"]
svc_web_app -->|public-api| svc_orders
svc_users["users"]
svc_web_app -->|public-api| svc_users
```

### Exports (0)

None.

### Outbound dependencies (2)

| Kind | Target | Export | Access | Details |
| --- | --- | --- | --- | --- |
| service-to-service | orders | public-api |  | protocol https, external, auth oauth2 |
| service-to-service | users | public-api |  | protocol https, external, auth oauth2 |

### Inbound dependencies (0)

None.

