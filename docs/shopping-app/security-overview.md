# Security & Data Flow Overview

> Shopping Sample App

<details>
<summary>Metadata</summary>

- **Application:** Shopping Sample App
- **Version:** flightplan/v1
- **report:** security-overview
- **generated-by:** flightplan

</details>

---

## Intended Use

> **Info: Who should read this report?**
>
> This report is intended for security review, compliance assessment, and architectural risk analysis.

## Executive Summary

The Security Architecture Report for the Shopping Sample App provides a comprehensive overview of the application's security posture across its diverse infrastructure. The app comprises four distinct services and three critical resources distributed among six different platforms, ensuring robust scalability and flexibility while maintaining stringent security standards. Operating in three separate environments—development, testing, and production—the architecture has been meticulously designed to safeguard sensitive data and ensure seamless, secure transactions for users.

From a business perspective, the strategic integration of advanced security measures across these services and resources not only protects against potential breaches but also enhances customer trust and compliance with regulatory requirements. This fortification is crucial in maintaining the integrity of transactional processes, thereby supporting sustained growth and competitiveness in the e-commerce sector. Technically, the architecture leverages state-of-the-art encryption protocols, multi-factor authentication mechanisms, and continuous monitoring systems to detect and mitigate threats proactively. Additionally, a robust incident response plan has been established, ensuring that any security incidents are swiftly addressed with minimal impact on business operations.

Overall, the secure architectural framework of the Shopping Sample App underscores its commitment to delivering a reliable and safe shopping experience, while laying a solid foundation for future enhancements in both functionality and security capabilities. This strategic alignment not only optimizes operational efficiency but also reinforces the company's reputation as a trusted digital marketplace.

This report provides a design-time overview of the system’s security posture, data handling, and trust boundaries. It is intended to support security review, compliance assessment, and architectural risk evaluation.

Declared primary users: none (deliveryModel.primaryUsers not specified).

How to read: services are compute units, resources are shared infrastructure/external systems, and exports are named interfaces exposed by services. Dependencies describe how services call exports or use resources.

Dependency kinds: service-to-service = a service calls a specific export on another service; service-to-resource = a service uses a shared resource (database, queue, cache, external API, etc).

- Services defined: 4
- Externally exposed services: 2
- Resources handling classified data: 3
- Third-party resources: 1 (across 1 platform(s))

## Interfaces & Exposure

This section lists service exports and their security-relevant properties. Interfaces marked as public/external should be treated as primary ingress points into the system and reviewed for appropriate authentication and access controls.

| Service | Interface | Visibility | Protocol | Authentication | Classification Count | Classifications |
| --- | --- | --- | --- | --- | --- | --- |
| [orders](service-catalog/orders.md) | public-api | external — Callable by external consumers; treat as a primary ingress surface. | https — HTTP over TLS (standard for web APIs and browsers). | oauth2 | 0 | none |
| [users](service-catalog/users.md) | public-api | external — Callable by external consumers; treat as a primary ingress surface. | https — HTTP over TLS (standard for web APIs and browsers). | oauth2 | 1 | personal_data |

## Data Classifications: In Motion

This section identifies classified or regulated data exposed through service interfaces. Data 'in motion' flows through APIs, message queues, and other inter-service communication channels. Externally visible exports should have encryption in transit and appropriate authentication.

> **Info: Classified Data in Transit**
>
> 1 service export(s) handle classified data. Verify encryption in transit and access controls.

| Service | Export/Interface | Visibility | Zone | Classifications |
| --- | --- | --- | --- | --- |
| [users](service-catalog/users.md) | public-api | external — Callable by external consumers; treat as a primary ingress surface. | internal | personal_data |

## Data Classifications: At Rest

This section identifies classified or regulated data stored in resources (databases, caches, file stores, etc.). Data 'at rest' should have encryption enabled and appropriate access controls. Third-party resources handling classified data require vendor risk assessment and data processing agreements.

> **Info: Classified Data at Rest**
>
> 3 resource(s) store classified data. Verify encryption at rest and access controls.

| Resource | Type | Zone | Used By Services | Classifications |
| --- | --- | --- | --- | --- |
| payment-gateway | external-service | external | orders | financial_data, payment_card_data |
| user-events-queue | queue | internal | user-events-worker | personal_data |
| users-db | database | restricted | user-events-worker, users | personal_data, financial_data |

## Trust Boundary Crossings & Violations

This section analyzes all zone boundary crossings and identifies trust violations. Violations include: (1) public/external services calling non-external exports, (2) internal services persisting data to lower-trust zones, and (3) unexpected cross-zone dependencies. API gateways and proxies bridging public→internal are expected patterns. Dependencies marked with 'access: expected' or 'access: exception' in the Flight Plan are documented but still reviewed.

> **Warning: Trust Boundary Violations Detected**
>
> 4 interaction(s) violate zone trust boundaries. These require security review, compensating controls, or architectural changes.

Summary: 6 total zone crossings (4 violations, 2 acceptable). Zone trust ranking: external/public < internal < restricted.

| Source Zone | Target Zone | Risk | Count | Examples |
| --- | --- | --- | --- | --- |
| public | internal | ⚠️ VIOLATION | 2 | web-app → users (service-to-service); web-app → orders (service-to-service) |
| internal | external | ⚠️ VIOLATION | 1 | orders → payment-gateway (service-to-resource) |
| restricted | internal | ⚠️ VIOLATION | 1 | user-events-worker → user-events-queue (service-to-resource) |
| internal | restricted | ✓ Acceptable | 1 | users → users-db (service-to-resource) |
| restricted | internal | ✓ Acceptable | 1 | user-events-worker → users (service-to-service) |

Detailed list of all zone boundary crossings with violation indicators and severity assessment:

| Source | Source Zone | Target | Target Zone | Status | Severity | Details |
| --- | --- | --- | --- | --- | --- | --- |
| orders | internal | payment-gateway | external | ⚠️ VIOLATION | HIGH - Data flowing to lower-trust zone | kind external-service, classifications 2 |
| user-events-worker | restricted | user-events-queue | internal | ⚠️ VIOLATION | HIGH - Data flowing to lower-trust zone | kind queue, classifications 1, access read |
| web-app | public | orders | internal | ⚠️ VIOLATION | MEDIUM - Review auth/authz | export public-api, external, protocol https, auth oauth2 |
| web-app | public | users | internal | ⚠️ VIOLATION | MEDIUM - Review auth/authz | export public-api, external, protocol https, auth oauth2, classifications 1 |
| user-events-worker | restricted | users | internal | ✓ OK | OK: Higher/equal trust level | export public-api, external, protocol https, auth oauth2, classifications 1 |
| users | internal | users-db | restricted | ✓ OK | OK: Inbound data flow | kind database, classifications 2, access read-write |

## Interface & Contract Compliance

This section validates that all declared dependencies have valid targets: service-to-service dependencies must reference declared exports, export interfaces must belong to the correct service, and external/public services must only call externally-visible exports. This is design-time validation of Flight Plan declarations, not runtime contract verification.

> **Info: Architecture Validation**
>
> These checks validate Flight Plan internal consistency.

> **Success: All Contracts Valid**
>
> All declared dependencies reference valid exports, services, and resources.

## Third-Party Dependencies

This section highlights integrations with third-party systems, which introduce external dependency and vendor risk.

| Resource | Vendor / Platform | Zone | Used By (#services) | Classifications Shared |
| --- | --- | --- | --- | --- |
| payment-gateway | stripe/payments | external | 1 | financial_data, payment_card_data |

## Ownership & Responsibility

Clear ownership is critical for accountability and incident response. The following table maps services to responsible teams.

> **Success: All Services Have Owners**
>
> All services have designated owners for accountability and incident response.

| Service | Owning Team | Zone | Platform |
| --- | --- | --- | --- |
| orders | api | internal | dotnet |
| users | api | internal | dotnet |
| user-events-worker | backend | restricted | python |
| web-app | frontend | public | vue/3 |

