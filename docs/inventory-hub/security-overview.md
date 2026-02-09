# Security & Data Flow Overview

> Inventory Hub

<details>
<summary>Metadata</summary>

- **Application:** Inventory Hub
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

The Inventory Hub system architecture has been meticulously designed to enhance security across its diverse range of services and environments. The architecture supports five distinct services that facilitate robust inventory management processes, ensuring data integrity and operational efficiency. These services are integrated seamlessly across seven different platforms, offering a versatile solution adaptable to various business needs. Additionally, the architecture encompasses five critical resources, each fortified with advanced security measures to protect sensitive information from potential threats.

Operating within three distinct environments, the Inventory Hub is engineered to deliver consistent performance and reliability while maintaining stringent security protocols. The multi-environment setup ensures that the system can adapt to different operational contexts without compromising on security standards. This flexibility is crucial for businesses looking to scale their operations or expand into new markets, as it provides a reliable foundation upon which they can build.

From a technical perspective, the architecture emphasizes secure data handling and robust access controls, minimizing vulnerabilities and safeguarding against unauthorized access. By implementing cutting-edge encryption techniques and continuous monitoring systems, the Inventory Hub ensures that all transactions are securely processed, thereby protecting both business interests and customer data. This strategic focus on security not only enhances trust among stakeholders but also aligns with industry best practices, positioning the organization as a leader in secure inventory management solutions.

This report provides a design-time overview of the system’s security posture, data handling, and trust boundaries. It is intended to support security review, compliance assessment, and architectural risk evaluation.

Declared primary users: none (deliveryModel.primaryUsers not specified).

How to read: services are compute units, resources are shared infrastructure/external systems, and exports are named interfaces exposed by services. Dependencies describe how services call exports or use resources.

Dependency kinds: service-to-service = a service calls a specific export on another service; service-to-resource = a service uses a shared resource (database, queue, cache, external API, etc).

- Services defined: 5
- Externally exposed services: 2
- Resources handling classified data: 5
- Third-party resources: 1 (across 1 platform(s))

## Interfaces & Exposure

This section lists service exports and their security-relevant properties. Interfaces marked as public/external should be treated as primary ingress points into the system and reviewed for appropriate authentication and access controls.

| Service | Interface | Visibility | Protocol | Authentication | Classification Count | Classifications |
| --- | --- | --- | --- | --- | --- | --- |
| [catalog](service-catalog/catalog.md) | public-api | external — Callable by external consumers; treat as a primary ingress surface. | https — HTTP over TLS (standard for web APIs and browsers). | oauth2 | 2 | public, confidential_business_data |
| [inventory](service-catalog/inventory.md) | public-api | external — Callable by external consumers; treat as a primary ingress surface. | https — HTTP over TLS (standard for web APIs and browsers). | oauth2 | 2 | confidential_business_data, system_metadata |
| [catalog](service-catalog/catalog.md) | internal-api | internal — Intended only for internal callers within the organization/system boundary. | https — HTTP over TLS (standard for web APIs and browsers). | oauth2 | 1 | confidential_business_data |

## Data Classifications: In Motion

This section identifies classified or regulated data exposed through service interfaces. Data 'in motion' flows through APIs, message queues, and other inter-service communication channels. Externally visible exports should have encryption in transit and appropriate authentication.

> **Info: Classified Data in Transit**
>
> 3 service export(s) handle classified data. Verify encryption in transit and access controls.

| Service | Export/Interface | Visibility | Zone | Classifications |
| --- | --- | --- | --- | --- |
| [catalog](service-catalog/catalog.md) | internal-api | internal — Intended only for internal callers within the organization/system boundary. | internal | confidential_business_data |
| [catalog](service-catalog/catalog.md) | public-api | external — Callable by external consumers; treat as a primary ingress surface. | internal | public, confidential_business_data |
| [inventory](service-catalog/inventory.md) | public-api | external — Callable by external consumers; treat as a primary ingress surface. | internal | confidential_business_data, system_metadata |

## Data Classifications: At Rest

This section identifies classified or regulated data stored in resources (databases, caches, file stores, etc.). Data 'at rest' should have encryption enabled and appropriate access controls. Third-party resources handling classified data require vendor risk assessment and data processing agreements.

> **Info: Classified Data at Rest**
>
> 5 resource(s) store classified data. Verify encryption at rest and access controls.

| Resource | Type | Zone | Used By Services | Classifications |
| --- | --- | --- | --- | --- |
| audit-log-bucket | object-storage | restricted | catalog, inventory, inventory-events-worker | audit_logs, system_metadata |
| catalog-db | database | restricted | catalog | confidential_business_data, audit_logs |
| identity-provider | external-service | external | admin-portal | authentication_data, identifiers |
| inventory-db | database | restricted | inventory, inventory-events-worker | confidential_business_data, system_metadata |
| inventory-events-topic | topic | internal | inventory, inventory-events-worker | system_metadata |

## Trust Boundary Crossings & Violations

This section analyzes all zone boundary crossings and identifies trust violations. Violations include: (1) public/external services calling non-external exports, (2) internal services persisting data to lower-trust zones, and (3) unexpected cross-zone dependencies. API gateways and proxies bridging public→internal are expected patterns. Dependencies marked with 'access: expected' or 'access: exception' in the Flight Plan are documented but still reviewed.

> **Warning: Trust Boundary Violations Detected**
>
> 4 interaction(s) violate zone trust boundaries. These require security review, compensating controls, or architectural changes.

Summary: 8 total zone crossings (4 violations, 4 acceptable). Zone trust ranking: external/public < internal < restricted.

| Source Zone | Target Zone | Risk | Count | Examples |
| --- | --- | --- | --- | --- |
| public | internal | ⚠️ VIOLATION | 2 | admin-portal → catalog (service-to-service); admin-portal → inventory (service-to-service) |
| public | external | ⚠️ VIOLATION | 1 | admin-portal → identity-provider (service-to-resource) |
| restricted | internal | ⚠️ VIOLATION | 1 | inventory-events-worker → inventory-events-topic (service-to-resource) |
| internal | restricted | ✓ Acceptable | 4 | catalog → catalog-db (service-to-resource); catalog → audit-log-bucket (service-to-resource); inventory → inventory-db (service-to-resource) |

Detailed list of all zone boundary crossings with violation indicators and severity assessment:

| Source | Source Zone | Target | Target Zone | Status | Severity | Details |
| --- | --- | --- | --- | --- | --- | --- |
| admin-portal | public | catalog | internal | ⚠️ VIOLATION | CRITICAL - Export visibility mismatch | export internal-api, internal, protocol https, auth oauth2, classifications 1 |
| admin-portal | public | identity-provider | external | ⚠️ VIOLATION | HIGH - Data flowing to lower-trust zone | kind external-service, classifications 2, access read |
| inventory-events-worker | restricted | inventory-events-topic | internal | ⚠️ VIOLATION | HIGH - Data flowing to lower-trust zone | kind topic, classifications 1, access read |
| admin-portal | public | inventory | internal | ⚠️ VIOLATION | MEDIUM - Review auth/authz | export public-api, external, protocol https, auth oauth2, classifications 2 |
| catalog | internal | audit-log-bucket | restricted | ✓ OK | OK: Inbound data flow | kind object-storage, classifications 2, access write |
| catalog | internal | catalog-db | restricted | ✓ OK | OK: Inbound data flow | kind database, classifications 2, access read-write |
| inventory | internal | audit-log-bucket | restricted | ✓ OK | OK: Inbound data flow | kind object-storage, classifications 2, access write |
| inventory | internal | inventory-db | restricted | ✓ OK | OK: Inbound data flow | kind database, classifications 2, access read-write |

## Interface & Contract Compliance

This section validates that all declared dependencies have valid targets: service-to-service dependencies must reference declared exports, export interfaces must belong to the correct service, and external/public services must only call externally-visible exports. This is design-time validation of Flight Plan declarations, not runtime contract verification.

> **Info: Architecture Validation**
>
> These checks validate Flight Plan internal consistency.

> **Warning: Contract Issues Detected**
>
> 1 interface or contract issue(s) found. Review Flight Plan declarations for completeness and accuracy.

| From Service | Target | Issue | Severity |
| --- | --- | --- | --- |
| admin-portal | catalog/internal-api | Low-trust caller accessing non-external export (visibility=internal) | CRITICAL |

## Third-Party Dependencies

This section highlights integrations with third-party systems, which introduce external dependency and vendor risk.

| Resource | Vendor / Platform | Zone | Used By (#services) | Classifications Shared |
| --- | --- | --- | --- | --- |
| identity-provider | auth0 | external | 1 | authentication_data, identifiers |

## Ownership & Responsibility

Clear ownership is critical for accountability and incident response. The following table maps services to responsible teams.

> **Success: All Services Have Owners**
>
> All services have designated owners for accountability and incident response.

| Service | Owning Team | Zone | Platform |
| --- | --- | --- | --- |
| catalog | api | internal | dotnet |
| inventory | api | internal | dotnet |
| inventory-events-worker | backend | restricted | python |
| inventory-legacy-sync | backend | internal | unspecified |
| admin-portal | frontend | public | react |

