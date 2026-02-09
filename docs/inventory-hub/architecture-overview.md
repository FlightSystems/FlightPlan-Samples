# Architecture Overview

> Sample application focused on catalog + inventory + auditability

<details>
<summary>Metadata</summary>

- **Application:** Inventory Hub
- **Version:** flightplan/v1
- **report:** architecture-overview
- **generated-by:** flightplan

</details>

---

## Intended Use

> **Info: Who should read this report?**
>
> This report is intended for engineering teams, architects, and onboarding developers to understand the system structure and dependencies.

## Executive Summary

The Inventory Hub system architecture has been meticulously designed to cater to diverse operational needs across multiple platforms and environments. This robust architecture supports five key services that streamline inventory management processes, ensuring seamless integration and efficient resource utilization. By leveraging these services across seven distinct platforms, the Inventory Hub facilitates a flexible yet cohesive operational framework, adaptable to varying business requirements and technological landscapes.

Crucially, the system is engineered to operate effectively in three different environments—development, testing, and production—which underpins its reliability and scalability. This multi-environment capability ensures that changes can be rigorously tested before deployment, minimizing disruptions and maintaining high service availability. The architectural design also optimizes resource allocation by utilizing five critical resources, ensuring that performance is sustained even as demand scales.

From a business perspective, the Inventory Hub delivers substantial value through enhanced operational efficiency and reduced downtime, directly translating into cost savings and improved customer satisfaction. Technically, its sophisticated architecture supports future growth and adaptation to emerging technologies, positioning it well for long-term success in managing complex inventory systems.

This report summarizes the Inventory Hub system using the compiled flight plan. It highlights the platform foundations, the service landscape, shared data contracts, and supporting resources used by the system.

How to read: services are compute units, resources are shared infrastructure/external systems, and exports are named interfaces exposed by services. Dependencies describe how services call exports or use resources.

| Key | Value |
| --- | ----- |
| Application Name | Inventory Hub |
| Application Type | saas-platform |
| Domain | Inventory management and auditability |
| Hosting | public-cloud — Runs primarily on a public cloud provider (AWS/Azure/GCP). |
| Service Model | SaaS — Software-as-a-Service (multi-tenant or single-tenant product delivered to customers). |
| Tenancy | multi-tenant — Multiple customers share resources with logical isolation (efficiency, requires strong controls). |
| Platforms | 7 |
| Services | 5 |
| Resources | 5 |
| Data Classifications | 6 |
| Environments | 3 |

## System Context

This section highlights external actors and external systems at the boundary of the application. It is a lightweight system context view (who calls in, and what the system depends on). External consumers can be human end users (browser/mobile), partner/customer integrations, scheduled jobs, and identity providers (IdPs)—anything outside the modeled services that calls an export.

No external consumers are declared. If this system has inbound actors (users, partners, IdPs, schedulers), model them via exports.*.consumers.

External systems are inferred from resources that run on SaaS platforms (or have external-* kinds).

| External System | Kind | Platform | Used By (#services) | Description |
| --- | --- | --- | --- | --- |
| identity-provider | external-service — Third-party or out-of-system dependency (SaaS/API/partner system). | auth0 | 1 | Third-party identity provider for workforce/admin access |

## Architecture Views

This section links to the key architecture views (system boundary, containers, deployments, and trust boundaries). Model these under annotations.architectureViews so teams can keep diagrams and narratives discoverable from the report.

> **Info: Not modeled yet**
>
> Architecture views is not modeled in the flight plan yet. Add it under top-level annotations to make this section actionable.

## System Functionality

This section summarizes what the system does, and maps that functionality to concrete services. Capabilities can be modeled per service via service.annotations.capabilities (or service.annotations.functions).

### User Interfaces

This area gathers the capabilities declared on web sites / UI services and produces both a per-UI inventory and an aggregated summary.

- UI services detected: 1
- UI services declaring capabilities: 0
- Unique UI capabilities declared: 0

> **Info: No UI capabilities declared**
>
> UI services were detected, but none declare capabilities. Add service.annotations.capabilities to each UI service to make this summary useful.

### Processing

This area summarizes non-UI (back-end) capabilities. It gathers declared service capabilities for processing, orchestration, automation, and internal APIs.

- Processing services detected: 4
- Processing services declaring capabilities: 0
- Unique processing capabilities declared: 0

Aggregated processing capability summary (top 30 by coverage):

| Capability | Coverage | Services |
| --- | --- | --- |

## Data Classification Overview

Classifications label the kinds of data handled by exports and resources (for example: PII, PCI, PHI, Confidential). Only classifications referenced by an entity are included in the compiled view, so this section reflects what is actually in use.

| Classification | Description |
| --- | --- |
| audit_logs | Security or compliance audit logs |
| authentication_data | Authentication credentials (passwords, tokens, secrets) |
| confidential_business_data | Confidential business or operational data |
| identifiers | Unique identifiers associated with individuals |
| public | Publicly available, non-sensitive information |
| system_metadata | System-generated metadata and identifiers |

## Data Usage

This section summarizes where data classifications appear in the architecture. Classifications can be attached to exports (data in motion) and resources (data at rest / external systems).

| Classification | Exports (#) | Resources (#) | Examples |
| --- | --- | --- | --- |
| audit_logs | 0 | 2 | e.g., audit-log-bucket, catalog-db |
| authentication_data | 0 | 1 | e.g., identity-provider |
| confidential_business_data | 3 | 2 | e.g., catalog/internal-api, catalog/public-api, inventory/public-api |
| identifiers | 0 | 1 | e.g., identity-provider |
| public | 1 | 0 | e.g., catalog/public-api |
| system_metadata | 1 | 3 | e.g., inventory/public-api, audit-log-bucket, inventory-db |

## Ownership + Support

This section clarifies who owns and operates the system (and how to get help). Model system-level details under annotations.ownership, and optionally service-level details under service.annotations.ownership.

| Key | Value |
| --- | ----- |
| technicalOwner | CTO (Platform Architecture) |
| productOwner | Product Manager |
| supportModel | L1: Support Desk, L2: Platform team, L3: Service owners |
| escalation | SEV1: page on-call; SEV2: create incident + notify team channel |

See full inventory in [Service Overview](#service-overview).

| Key | Value |
| --- | ----- |
| Services | 5 |
| With Owner | 5/5 |
| With Explicit On-Call | 0/5 |
| Inherited from Team | 3/5 |
| Assumed via Owner | 2/5 |
| With Support Route | 5/5 |
| With Repo URL | 0/5 |

Ownership distribution:

| Owner/Team | Services (#) | On-Call Coverage | Examples |
| --- | --- | --- | --- |
| api | 2 | 2/2 | [catalog](service-catalog/catalog.md), [inventory](service-catalog/inventory.md) |
| backend | 2 | 2/2 | [inventory-events-worker](service-catalog/inventory-events-worker.md), [inventory-legacy-sync](service-catalog/inventory-legacy-sync.md) |
| frontend | 1 | 1/1 | [admin-portal](service-catalog/admin-portal.md) |

> **Info: On-call not explicitly modeled**
>
> Some services do not specify an on-call route; support will be assumed via the owner/team. Consider adding service.annotations.ownership.onCall for higher operational clarity (PagerDuty rota, Slack channel, etc.). Examples: [catalog](service-catalog/catalog.md), [inventory](service-catalog/inventory.md)

## Operational Readiness

This section captures best-practice operational and security expectations (SLOs, DR, observability, deployment, and governance). If details are not modeled yet, the report will call that out explicitly.

### Non-Functional Targets

Target outcomes for reliability and performance: availability, latency, throughput, and error budget. Model these under annotations.nonFunctional (e.g., availability, latencyP95, throughputRps, errorBudgetPolicy).

| Key | Value |
| --- | ----- |
| availability | 99.9% |
| latencyP95 | 250ms |
| throughputRps | 200 |
| errorBudgetPolicy | burn alerts @ 2x/5x |

### Reliability + DR

Disaster recovery and resiliency expectations: RTO/RPO, backups, restore testing, and failure-mode handling. Model under annotations.reliability (e.g., rto, rpo, backupStrategy, restoreTestCadence, idempotency, retryPolicy).

| Key | Value |
| --- | ----- |
| rto | 4h |
| rpo | 15m |
| backupStrategy | nightly + PITR |
| restoreTestCadence | quarterly — Restore procedures are tested quarterly. |
| retryPolicy | exponential backoff; max 3 |
| timeoutPolicy | 2s service-to-service; 10s external |
| idempotency | required — Operations must be safe to retry (same request can be applied multiple times). for inventory changes |

### Observability + Operations

What you can see and how you operate it: logs, metrics, traces, dashboards, alerts, and runbooks. Model under annotations.observability (e.g., logging, metrics, tracing, dashboards, alerts, runbooks).

| Key | Value |
| --- | ----- |
| logging | structured — Machine-parseable logs (JSON) with consistent fields and correlation IDs. JSON logs |
| metrics | RED + saturation |
| tracing | OpenTelemetry end-to-end |

### Security Posture

High-level security architecture: authn/authz model, boundary controls, encryption, secrets, and audit expectations. Model under annotations.security (e.g., authModel, authorizationModel, auditLogging, encryptionAtRest, encryptionInTransit, secretsManagement).

| Key | Value |
| --- | ----- |
| authModel | Users are authenticated by MFA — Multi-factor authentication is required for user sign-in (e.g., TOTP, WebAuthn/passkeys). Usually enforced by the IdP.; gateway validates JWT — JWT-based auth where clients present signed tokens (bearer tokens) validated by the gateway and/or services (issuer/audience/expiry). |
| authorizationModel | RBAC — Role-based access control (roles grant permissions). + tenant-scoped claims |
| auditLogging | all claim access + admin actions |
| encryptionAtRest | AES-256 managed keys |
| encryptionInTransit | TLS — TLS used for network transport encryption. 1.2+ everywhere |

### Data Governance

Data ownership and lifecycle: system-of-record, retention/deletion, access controls, and compliance requirements. Model under annotations.dataGovernance (e.g., systemOfRecord, retentionPolicy, deletionPolicy, compliance).

| Key | Value |
| --- | ----- |
| systemOfRecord | claims-db |
| retentionPolicy | 7 years |
| deletionPolicy | tenant offboarding workflow |
| compliance | HIPAA — Health Insurance Portability and Accountability Act (US healthcare). |

### Deployment + Delivery

How the system is deployed and released: topology, ingress/TLS termination, rollout/rollback, and migrations. Model under annotations.deployment (e.g., topology, ingress, tlsTermination, rolloutStrategy, rollbackStrategy, migrationStrategy).

| Key | Value |
| --- | ----- |
| topology | microservices — Multiple independently deployable services communicating over the network., event-driven — Asynchronous integration via events/streams; services react to published events., batch — Scheduled or triggered jobs processing data in discrete runs. |
| tlsTermination | ingress controller |
| rolloutStrategy | rolling — Gradually replace instances with the new version (no big-bang cutover). |
| rollbackStrategy | automated on SLO burn |
| migrationStrategy | prefer backward-compatible — Migrations that can run without coordinated downtime and support old/new app versions., alternate expand-contract — Two-phase schema change: add backwards-compatible changes, deploy app, then remove old fields. |

### API Governance

Policies for interface evolution and protection: versioning, deprecation, rate limiting, and contract ownership. Model under annotations.apiGovernance (e.g., versioningPolicy, deprecationPolicy, rateLimiting, contractOwnership).

| Key | Value |
| --- | ----- |
| versioningPolicy | URI versioning; v1/v2 |
| deprecationPolicy | 90-day notice |
| rateLimiting | per-tenant quotas at gateway |
| contractOwnership | owning team per export |

### Tenancy Model

Details for multi-tenancy and isolation: partitioning, tenant-aware authz, and noisy-neighbor mitigation. Model under annotations.tenancy (e.g., isolationModel, partitioningStrategy, tenantAwareAuthz, noisyNeighborMitigation).

| Key | Value |
| --- | ----- |
| isolationModel | shared — Tenants share compute/storage with logical isolation. DB, tenant partition keys |
| partitioningStrategy | tenant_id |
| tenantAwareAuthz | required on every request |

## Environment Overview

Environments describe the SDLC/runtime progression for deployments (e.g., dev → uat → prod). Promotion flow is modeled via environments.*.promotesTo.

| Environment | Promotes To | Description |
| --- | --- | --- |
| dev | staging | Development environment |
| staging | prod | Staging environment |
| prod |  | Production environment |

## Platform Overview

> **Info: AI Analysis**
>
> The FlightPlan architecture report reveals a platform distribution that favors backend technologies with three services built on `dotnet/8`, while front-end development is concentrated on `react/18`. This indicates a microservices-oriented approach where `dotnet` likely serves as the backbone for server-side logic and APIs. The choice of `dotnet/8` signifies an investment in a robust, scalable platform capable of handling complex backend operations, which is crucial for performance-intensive applications.
>
> The integration with AWS services (`rds-postgresql`, `s3`, `sns`) suggests a cloud-centric strategy that leverages managed databases, storage solutions, and messaging systems to enhance scalability, reliability, and operational efficiency. However, this distribution raises considerations around inter-service communication and potential latency issues inherent in distributed architectures. Additionally, the use of `auth0` for authentication implies a focus on security best practices, but it necessitates vigilance regarding the secure configuration of third-party services to mitigate risks associated with data breaches or unauthorized access.
>
> The deployment of only one service each on `python/3.12` and `react/18`, along with reliance on AWS's managed solutions, reflects a strategic choice favoring streamlined development and operations. However, it also introduces potential vendor lock-in challenges, particularly concerning AWS services, which could complicate future migrations or integrations with other cloud providers. Overall, the architecture demonstrates a balanced approach between leveraging cutting-edge technologies for robust backend processing and ensuring a responsive front-end user experience, albeit with inherent risks that necessitate careful management.

Platforms describe the technology foundations the architecture depends on (cloud providers, managed services, runtimes, and SaaS). This section lists the platforms referenced by the compiled plan.

| Platform | Type | Description |
| --- | --- | --- |
| auth0 | saas | Auth0 Identity Platform |
| aws/rds-postgresql | cloud | Amazon RDS for PostgreSQL |
| aws/s3 | cloud | Amazon S3 |
| aws/sns | cloud | Amazon SNS |
| dotnet | tech | .NET Runtime |
| python | tech | Python |
| react | tech | React |

## Toolchain Overview

This section summarizes the default lifecycle toolchain for the application (repo/work tracking/build/deploy/etc) and any service-level overrides. Model the default under the top-level toolchain: map, and overrides under each service.toolchain: map.

| Lifecycle step | Default tool |
| --- | --- |
| build | [github-actions](https://github.com/XeoHealth) (ci-cd, GitHub) |
| deploy | octopus-deploy (deployment, Octopus) |
| repo | [github-repos](https://github.com/XeoHealth) (source-control, GitHub) |
| work-tracking | [jira](https://xeohealth.jira.atlassian.com) (work-tracking, Atlassian) |

## Tooling Overview

This section lists development and operational tooling that supports the system lifecycle (source control, CI/CD, observability, on-call, work tracking, etc.). Model these under the top-level tooling: map.

| Tool | Kind | Provider | Organization | Zone | Owner | URL |
| --- | --- | --- | --- | --- | --- | --- |
| github-actions | ci-cd | GitHub | XeoHealth | external |  | [link](https://github.com/XeoHealth) |
| github-repos | source-control | GitHub | XeoHealth | external |  | [link](https://github.com/XeoHealth) |
| jira | work-tracking | Atlassian |  | external |  | [link](https://xeohealth.jira.atlassian.com) |
| octopus-deploy | deployment | Octopus |  | internal |  |  |
| opsgenie | on-call | Atlassian |  | external |  |  |
| splunk | observability | Splunk |  | internal |  |  |
| teamcity | ci-cd |  |  | internal |  |  |

## Service Overview

> **Info: AI Analysis**
>
> The FlightPlan architecture delineates a service distribution across three teams—frontend, API, and backend—with a total of five services. The frontend team is responsible for a single public-facing service, suggesting a streamlined user interface layer that may facilitate maintenance and reduce complexity in client-side interactions. However, the limited number of frontend services necessitates robust backend support to handle diverse business logic efficiently, evidenced by two dedicated backend teams managing internal and restricted zones.
>
> In terms of risk management, the segregation into public, internal, and restricted service zones implies a well-considered security model. The single public zone indicates a clear boundary for external interactions, while the three internal and one restricted zones suggest layered access controls and data protection measures. This distribution minimizes exposure risks but requires rigorous inter-service communication protocols to ensure seamless integration across teams.
>
> A notable architectural decision is the deployment of multiple API services within two teams, likely designed to modularize functionality and enhance scalability. However, this setup might introduce complexities in service orchestration and dependency management, necessitating robust monitoring tools and practices to maintain system reliability and performance.

Services are the primary compute units in the system. The summary table provides a quick inventory. For detailed exports and dependencies per service, see the published [Service Catalog](service-catalog/index.html).

Summary of all services in the compiled plan, including export and dependency counts.

| Service | Repo | Owner | Platform | Zone | Exports | Outbound | Inbound | Description |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| [admin-portal](service-catalog/admin-portal.md) |  | frontend | react | public | 0 | 3 | 0 | Admin UI for catalog and inventory operations |
| [catalog](service-catalog/catalog.md) |  | api | dotnet | internal | 2 | 2 | 2 | Catalog and merchandising API |
| [inventory](service-catalog/inventory.md) |  | api | dotnet | internal | 1 | 4 | 2 | Inventory reservation and allocation API |
| [inventory-events-worker](service-catalog/inventory-events-worker.md) |  | backend | python | restricted | 0 | 3 | 0 | Consumes inventory events and materializes audit/analytics projections |
| [inventory-legacy-sync](service-catalog/inventory-legacy-sync.md) |  | backend |  | internal | 0 | 1 | 0 | Legacy partner sync job (intentionally missing platform for demo findings) |

## Resource Overview

> **Info: AI Analysis**
>
> The FlightPlan architecture comprises a total of five resources, distributed across four distinct types: two databases, one topic, one object-storage, and one external service. This distribution suggests a balanced yet focused approach to resource allocation, with a notable emphasis on data storage and retrieval capabilities. The presence of two database resources indicates a potential need for high availability or redundancy, which is crucial for ensuring data integrity and minimizing downtime in critical applications. The inclusion of an object-storage resource further underscores the importance placed on scalable and durable data storage solutions, likely to support large volumes of unstructured data.
>
> The architecture's reliance on a single topic implies a streamlined communication or messaging pattern, possibly leveraging publish-subscribe mechanisms for efficient event-driven interactions. However, this could also pose a risk if not managed properly, as it may become a bottleneck under high load conditions. The external service component introduces an element of dependency and potential latency issues, which must be carefully monitored to maintain overall system performance. This setup reflects a strategic decision to balance internal data management with external integrations, highlighting the importance of robust communication channels and failover strategies in maintaining operational resilience.

Resources represent shared infrastructure and external systems used by services (e.g., databases, queues, caches, and third-party APIs). They are grouped below by kind to make usage patterns easier to scan.

### Kind: database

2 resource(s) of kind 'database'. Grouped by platform.

#### Platform: aws/rds-postgresql

2 resource(s) on platform 'aws/rds-postgresql'.

| Resource | Platform | Zone | Used By (#services) | Handles Data | Description |
| --- | --- | --- | --- | --- | --- |
| [catalog-db](resource-catalog/catalog-db.md) | aws/rds-postgresql | restricted | 1 | yes (2) | Product catalog and merchandising data |
| [inventory-db](resource-catalog/inventory-db.md) | aws/rds-postgresql | restricted | 2 | yes (2) | Inventory levels, reservations, and warehouse allocations |

### Kind: external-service

1 resource(s) of kind 'external-service'. Grouped by platform.

#### Platform: auth0

1 resource(s) on platform 'auth0'.

| Resource | Platform | Zone | Used By (#services) | Handles Data | Description |
| --- | --- | --- | --- | --- | --- |
| [identity-provider](resource-catalog/identity-provider.md) | auth0 | external | 1 | yes (2) | Third-party identity provider for workforce/admin access |

### Kind: object-storage

1 resource(s) of kind 'object-storage'. Grouped by platform.

#### Platform: aws/s3

1 resource(s) on platform 'aws/s3'.

| Resource | Platform | Zone | Used By (#services) | Handles Data | Description |
| --- | --- | --- | --- | --- | --- |
| [audit-log-bucket](resource-catalog/audit-log-bucket.md) | aws/s3 | restricted | 3 | yes (2) | Immutable audit log archive for inventory operations |

### Kind: topic

1 resource(s) of kind 'topic'. Grouped by platform.

#### Platform: aws/sns

1 resource(s) on platform 'aws/sns'.

| Resource | Platform | Zone | Used By (#services) | Handles Data | Description |
| --- | --- | --- | --- | --- | --- |
| [inventory-events-topic](resource-catalog/inventory-events-topic.md) | aws/sns | internal | 2 | yes (1) | Event fanout for inventory changes |

