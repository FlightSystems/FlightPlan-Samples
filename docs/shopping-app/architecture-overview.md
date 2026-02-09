# Architecture Overview

> Sample application demonstrating Flight Plan features

<details>
<summary>Metadata</summary>

- **Application:** Shopping Sample App
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

The Shopping Sample App is a sophisticated platform designed to streamline online retail operations and enhance customer engagement through its well-integrated architecture. At its core, the application features four distinct services that work in concert to deliver a seamless shopping experience. These services are strategically deployed across six different platforms, ensuring robustness and scalability. The architectural design supports three diverse environments—development, testing, and production—each tailored to facilitate continuous integration and delivery while maintaining high standards of reliability and performance.

From a technical standpoint, the architecture leverages three key resources that optimize both operational efficiency and user satisfaction. These include scalable databases for managing transactional data, high-performance caching mechanisms to reduce latency, and advanced analytics services for real-time insights into customer behavior. This configuration not only supports rapid growth but also enhances the agility of business operations, enabling quick adaptation to market demands.

The business value derived from this architecture is multifaceted. By integrating cutting-edge technologies across various platforms and environments, the Shopping Sample App delivers a robust framework that reduces operational costs and improves time-to-market for new features. This ensures competitive advantage in a dynamic retail landscape. Moreover, the architecture's emphasis on scalability and performance supports a superior customer experience, fostering increased engagement and loyalty. Overall, this strategic design not only meets current business requirements but is also poised to accommodate future growth and innovation needs.

This report summarizes the Shopping Sample App system using the compiled flight plan. It highlights the platform foundations, the service landscape, shared data contracts, and supporting resources used by the system.

How to read: services are compute units, resources are shared infrastructure/external systems, and exports are named interfaces exposed by services. Dependencies describe how services call exports or use resources.

| Key | Value |
| --- | ----- |
| Application Name | Shopping Sample App |
| Platforms | 6 |
| Services | 4 |
| Resources | 3 |
| Data Classifications | 3 |
| Environments | 3 |

## System Context

This section highlights external actors and external systems at the boundary of the application. It is a lightweight system context view (who calls in, and what the system depends on). External consumers can be human end users (browser/mobile), partner/customer integrations, scheduled jobs, and identity providers (IdPs)—anything outside the modeled services that calls an export.

No external consumers are declared. If this system has inbound actors (users, partners, IdPs, schedulers), model them via exports.*.consumers.

External systems are inferred from resources that run on SaaS platforms (or have external-* kinds).

| External System | Kind | Platform | Used By (#services) | Description |
| --- | --- | --- | --- | --- |
| payment-gateway | external-service — Third-party or out-of-system dependency (SaaS/API/partner system). | stripe/payments | 1 | Third-party payment gateway |

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

- Processing services detected: 3
- Processing services declaring capabilities: 0
- Unique processing capabilities declared: 0

Aggregated processing capability summary (top 30 by coverage):

| Capability | Coverage | Services |
| --- | --- | --- |

## Data Classification Overview

Classifications label the kinds of data handled by exports and resources (for example: PII, PCI, PHI, Confidential). Only classifications referenced by an entity are included in the compiled view, so this section reflects what is actually in use.

| Classification | Description |
| --- | --- |
| financial_data | Financial account or transaction information |
| payment_card_data | Payment card information (PCI regulated) |
| personal_data | Personally identifiable information (PII) |

## Data Usage

This section summarizes where data classifications appear in the architecture. Classifications can be attached to exports (data in motion) and resources (data at rest / external systems).

| Classification | Exports (#) | Resources (#) | Examples |
| --- | --- | --- | --- |
| financial_data | 0 | 2 | e.g., payment-gateway, users-db |
| payment_card_data | 0 | 1 | e.g., payment-gateway |
| personal_data | 1 | 2 | e.g., users/public-api, user-events-queue, users-db |

## Ownership + Support

This section clarifies who owns and operates the system (and how to get help). Model system-level details under annotations.ownership, and optionally service-level details under service.annotations.ownership.

> **Info: Not modeled yet**
>
> System ownership/support is not modeled in the flight plan yet. Add it under top-level annotations to make this section actionable.

See full inventory in [Service Overview](#service-overview).

| Key | Value |
| --- | ----- |
| Services | 4 |
| With Owner | 4/4 |
| With Explicit On-Call | 0/4 |
| Inherited from Team | 2/4 |
| Assumed via Owner | 2/4 |
| With Support Route | 4/4 |
| With Repo URL | 0/4 |

Ownership distribution:

| Owner/Team | Services (#) | On-Call Coverage | Examples |
| --- | --- | --- | --- |
| api | 2 | 2/2 | [orders](service-catalog/orders.md), [users](service-catalog/users.md) |
| backend | 1 | 1/1 | [user-events-worker](service-catalog/user-events-worker.md) |
| frontend | 1 | 1/1 | [web-app](service-catalog/web-app.md) |

> **Info: On-call not explicitly modeled**
>
> Some services do not specify an on-call route; support will be assumed via the owner/team. Consider adding service.annotations.ownership.onCall for higher operational clarity (PagerDuty rota, Slack channel, etc.). Examples: [orders](service-catalog/orders.md), [users](service-catalog/users.md)

## Operational Readiness

This section captures best-practice operational and security expectations (SLOs, DR, observability, deployment, and governance). If details are not modeled yet, the report will call that out explicitly.

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
> The FlightPlan architecture report indicates a multi-faceted platform distribution with an emphasis on Microsoft's .NET 8 framework, which is employed in two services, suggesting its central role in backend or core processing tasks within this architecture. This choice underscores a strategic preference for robust performance and scalability features that .NET 8 offers. Meanwhile, the presence of Python 3.12 and Vue.js 3 highlights the utilization of a modern JavaScript framework for frontend development alongside Python's versatility for scripting or automation tasks, potentially indicating a separation between front-end user interface concerns and server-side logic.
>
> The integration of AWS services such as RDS Postgres for database management and SQS for message queuing demonstrates reliance on cloud infrastructure for scalability and reliability. The adoption of Stripe for payments indicates the necessity to handle financial transactions securely and efficiently within this ecosystem. However, given that the report lists only four total services with a distribution heavily weighted towards .NET 8 (50% of services), there is a potential risk of vendor lock-in or over-reliance on Microsoft technologies which could impact future flexibility. Moreover, the lack of diversity in programming languages and frameworks may constrain the ability to rapidly adapt to emerging trends or integrate varied third-party solutions. It will be critical for FlightPlan's architecture to maintain modularity and interoperability between its components to mitigate these risks while leveraging each platform's strengths effectively.

Platforms describe the technology foundations the architecture depends on (cloud providers, managed services, runtimes, and SaaS). This section lists the platforms referenced by the compiled plan.

| Platform | Type | Description |
| --- | --- | --- |
| aws/rds-postgresql | cloud | Amazon RDS for PostgreSQL |
| aws/sqs | cloud | Amazon SQS |
| dotnet | tech | .NET Runtime |
| python | tech | Python |
| stripe/payments | saas | Stripe Payments |
| vue/3 | tech | Vue.js 3 |

## Service Overview

> **Info: AI Analysis**
>
> The FlightPlan architecture delineates a distributed service model with a total of four services allocated across three distinct teams: frontend (1), API (2), and backend (1). The allocation suggests a division that emphasizes both user-facing interfaces and robust data management, indicative of a balanced focus on accessibility and functionality. This distribution also implies potential bottlenecks or single points of failure, particularly if the frontend service becomes overloaded without sufficient capacity to scale.
>
> The architectural setup across three zones—public, internal, and restricted—reflects a nuanced approach to access control and security. The public zone hosts presumably user-facing elements that require high availability and scalability, while the internal and restricted zones likely manage sensitive operations and data handling, which necessitates stringent security measures. This tri-zonal strategy supports operational flexibility but also introduces complexities in ensuring seamless integration between services across different zones. Furthermore, with only one team dedicated to backend services, there is a risk of limited agility in scaling or modifying backend components, potentially impacting the overall system's responsiveness and adaptability to changing requirements.
>
> Overall, while the architecture exhibits strategic compartmentalization for security and efficiency, it must address potential scalability issues within frontend and backend services alongside ensuring robust inter-service communication across its varied zones.

Services are the primary compute units in the system. The summary table provides a quick inventory. For detailed exports and dependencies per service, see the published [Service Catalog](service-catalog/index.html).

Summary of all services in the compiled plan, including export and dependency counts.

| Service | Repo | Owner | Platform | Zone | Exports | Outbound | Inbound | Description |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| [orders](service-catalog/orders.md) |  | api | dotnet | internal | 1 | 2 | 1 | Order processing service |
| [user-events-worker](service-catalog/user-events-worker.md) |  | backend | python | restricted | 0 | 3 | 0 | Consumer for domain events |
| [users](service-catalog/users.md) |  | api | dotnet | internal | 1 | 1 | 3 | User management service |
| [web-app](service-catalog/web-app.md) |  | frontend | vue/3 | public | 0 | 2 | 0 | Frontend web application |

## Resource Overview

> **Info: AI Analysis**
>
> The FlightPlan architecture consists of three distinct resources: a database, a queue, and an external service. This configuration suggests a decoupled system where each component serves specific roles. The presence of a queue indicates a need for asynchronous processing, which is essential for handling tasks that require eventual consistency or when the database cannot be accessed directly due to performance constraints. This setup likely supports scalability by allowing different components to operate independently and manage workloads efficiently.
>
> However, this architecture introduces potential risks related to data consistency and latency. With an external service involved, there's a dependency on third-party reliability, which could affect system availability or introduce delays if the service experiences downtime. Moreover, relying on a queue for task management necessitates robust error handling and retry mechanisms to ensure no messages are lost during transit. The choice of having a single database resource also raises concerns about potential bottlenecks under high load conditions, emphasizing the need for careful capacity planning and optimization strategies. Overall, while this architecture supports flexibility and scalability, it requires diligent monitoring and management to mitigate associated risks effectively.

Resources represent shared infrastructure and external systems used by services (e.g., databases, queues, caches, and third-party APIs). They are grouped below by kind to make usage patterns easier to scan.

### Kind: database

1 resource(s) of kind 'database'. Grouped by platform.

#### Platform: aws/rds-postgresql

1 resource(s) on platform 'aws/rds-postgresql'.

| Resource | Platform | Zone | Used By (#services) | Handles Data | Description |
| --- | --- | --- | --- | --- | --- |
| [users-db](resource-catalog/users-db.md) | aws/rds-postgresql | restricted | 2 | yes (2) | Primary user database |

### Kind: external-service

1 resource(s) of kind 'external-service'. Grouped by platform.

#### Platform: stripe/payments

1 resource(s) on platform 'stripe/payments'.

| Resource | Platform | Zone | Used By (#services) | Handles Data | Description |
| --- | --- | --- | --- | --- | --- |
| [payment-gateway](resource-catalog/payment-gateway.md) | stripe/payments | external | 1 | yes (2) | Third-party payment gateway |

### Kind: queue

1 resource(s) of kind 'queue'. Grouped by platform.

#### Platform: aws/sqs

1 resource(s) on platform 'aws/sqs'.

| Resource | Platform | Zone | Used By (#services) | Handles Data | Description |
| --- | --- | --- | --- | --- | --- |
| [user-events-queue](resource-catalog/user-events-queue.md) | aws/sqs | internal | 1 | yes (1) | Queue for user-related events |

