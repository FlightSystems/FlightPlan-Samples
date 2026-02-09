# Service Catalog

> Service index (one file per service)

<details>
<summary>Metadata</summary>

- **Application:** Shopping Sample App
- **Version:** flightplan/v1
- **report:** service-catalog
- **generated-by:** flightplan

</details>

---

## At a glance

This report is a detailed inventory. It is useful for audits, onboarding, and operational ownership mapping. For higher-level system structure, see the Architecture Overview report.

| Key | Value |
| --- | ----- |
| Application | Shopping Sample App |
| Services | 4 |
| Resources | 3 |
| Interfaces | 2 |
| Dependencies | 8 |

## Service Catalog

This is an index of services. Each service links to a separate detail page.

| Service | Repo | Owner | Platform | Zone | Exports | Outbound | Inbound | Capabilities |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| [Order processing service](orders.md) |  | api | dotnet | internal | 1 | 2 | 1 |  |
| [Consumer for domain events](user-events-worker.md) |  | backend | python | restricted | 0 | 3 | 0 |  |
| [User management service](users.md) |  | api | dotnet | internal | 1 | 1 | 3 |  |
| [Frontend web application](web-app.md) |  | frontend | vue/3 | public | 0 | 2 | 0 |  |

## Entry Points

Entry points are exports intended to be called from outside the modeled service boundary (e.g., public APIs, partner integrations, web entry points). This is a quick scan for exposure, auth, and interface contracts.

Showing 1 terminal entry point(s) (excluding 1 exposed export(s) that are reachable from another entry point’s dependency chain).

| Service | Export | Visibility | Protocol | Auth | Consumers | Data |
| --- | --- | --- | --- | --- | --- | --- |
| [Order processing service](orders.md) | public-api | external — Callable by external consumers; treat as a primary ingress surface. | https — HTTP over TLS (standard for web APIs and browsers). | oauth2 — OAuth 2.0 (often with OIDC) for delegated authorization via access tokens. |  |  |

## Hotspots

This section highlights interaction hotspots: services with high fan-in/fan-out, cross-zone calls, and external exposure. Use these to prioritize architecture reviews and decomposition work.

Hotspot score is a heuristic: inbound calls + outbound calls + resource uses + (2× cross-zone outbound) + (2× externally exposed exports). Treat this as a review queue, not a quality verdict.

| Service | Zone | Inbound | Outbound (Svc) | Outbound (Res) | Cross-Zone Out | External Exports | Score |
| --- | --- | --- | --- | --- | --- | --- | --- |
| [User management service](users.md) | internal | 3 | 0 | 1 | 0 | 1 | 6 |
| [Frontend web application](web-app.md) | public | 0 | 2 | 0 | 2 | 0 | 6 |
| [Order processing service](orders.md) | internal | 1 | 1 | 1 | 0 | 1 | 5 |
| [Consumer for domain events](user-events-worker.md) | restricted | 0 | 1 | 2 | 1 | 0 | 5 |

