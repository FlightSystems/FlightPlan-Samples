# Service Catalog

> Service index (one file per service)

<details>
<summary>Metadata</summary>

- **Application:** Inventory Hub
- **Version:** flightplan/v1
- **report:** service-catalog
- **generated-by:** flightplan

</details>

---

## At a glance

This report is a detailed inventory. It is useful for audits, onboarding, and operational ownership mapping. For higher-level system structure, see the Architecture Overview report.

| Key | Value |
| --- | ----- |
| Application | Inventory Hub |
| Services | 5 |
| Resources | 5 |
| Interfaces | 3 |
| Dependencies | 13 |

## Service Catalog

This is an index of services. Each service links to a separate detail page.

| Service | Repo | Owner | Platform | Zone | Exports | Outbound | Inbound | Capabilities |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| [Admin UI for catalog and inventory operations](admin-portal.md) |  | frontend | react | public | 0 | 3 | 0 |  |
| [Catalog and merchandising API](catalog.md) |  | api | dotnet | internal | 2 | 2 | 2 |  |
| [Inventory reservation and allocation API](inventory.md) |  | api | dotnet | internal | 1 | 4 | 2 |  |
| [Consumes inventory events and materializes audit/analytics projections](inventory-events-worker.md) |  | backend | python | restricted | 0 | 3 | 0 |  |
| [Legacy partner sync job (intentionally missing platform for demo findings)](inventory-legacy-sync.md) |  | backend |  | internal | 0 | 1 | 0 |  |

## Entry Points

Entry points are exports intended to be called from outside the modeled service boundary (e.g., public APIs, partner integrations, web entry points). This is a quick scan for exposure, auth, and interface contracts.

Showing 1 terminal entry point(s) (excluding 1 exposed export(s) that are reachable from another entry point’s dependency chain).

| Service | Export | Visibility | Protocol | Auth | Consumers | Data |
| --- | --- | --- | --- | --- | --- | --- |
| [Inventory reservation and allocation API](inventory.md) | public-api | external — Callable by external consumers; treat as a primary ingress surface. | https — HTTP over TLS (standard for web APIs and browsers). | oauth2 — OAuth 2.0 (often with OIDC) for delegated authorization via access tokens. |  | confidential_business_data, system_metadata |

## Hotspots

This section highlights interaction hotspots: services with high fan-in/fan-out, cross-zone calls, and external exposure. Use these to prioritize architecture reviews and decomposition work.

Hotspot score is a heuristic: inbound calls + outbound calls + resource uses + (2× cross-zone outbound) + (2× externally exposed exports). Treat this as a review queue, not a quality verdict.

| Service | Zone | Inbound | Outbound (Svc) | Outbound (Res) | Cross-Zone Out | External Exports | Score |
| --- | --- | --- | --- | --- | --- | --- | --- |
| [Inventory reservation and allocation API](inventory.md) | internal | 2 | 1 | 3 | 0 | 1 | 8 |
| [Admin UI for catalog and inventory operations](admin-portal.md) | public | 0 | 2 | 1 | 2 | 0 | 7 |
| [Catalog and merchandising API](catalog.md) | internal | 2 | 0 | 2 | 0 | 1 | 6 |
| [Consumes inventory events and materializes audit/analytics projections](inventory-events-worker.md) | restricted | 0 | 0 | 3 | 0 | 0 | 3 |
| [Legacy partner sync job (intentionally missing platform for demo findings)](inventory-legacy-sync.md) | internal | 0 | 1 | 0 | 0 | 0 | 1 |

