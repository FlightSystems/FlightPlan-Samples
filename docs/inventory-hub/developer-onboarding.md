# Developer Onboarding

> Step-by-step orientation guide for engineers new to the system

<details>
<summary>Metadata</summary>

- **Application:** Inventory Hub
- **Version:** flightplan/v1
- **report:** developer-onboarding
- **generated-by:** flightplan

</details>

---

## Start here (10–15 minutes)

> **Info: Goal**
>
> This report is a quick orientation checklist. It intentionally links out to the deeper reports instead of duplicating full inventories.

- Open the [published table of contents](index.md) and skim the report list.
- Use the [step map](#steps) below to navigate by topic (architecture, repos, deployments, security, etc).
- Read [Architecture Overview](architecture-overview.md) for system context, toolchain, and operational readiness.
- Scan [Entry Points](service-catalog/index.md#entry-points) to see the front doors, auth, and data contracts.
- Use [Service Catalog](service-catalog/index.md) to jump to repos and owners (and per-service dependencies).
- If you’re shipping changes, review [Deployment Alignment](deployment-alignment.md) for intent vs deployed reality.
- For security review context, start with [Security Overview](security-overview.md) (exposure + trust boundaries).

## System at a glance

> **Info: AI Insights**
>
> The Inventory Hub application presents a moderately complex architecture with its composition of five services, resources, platforms, and three distinct environments. This configuration suggests an architectural decision to balance granularity in service decomposition while maintaining manageability across multiple platforms—potentially indicating support for diverse technology stacks or integration points. The presence of seven different platforms could signify the need for interoperability or scalability, possibly accommodating various deployment scenarios or compliance with disparate system requirements.
>
> A critical pattern observed is the equal count of services and resources, hinting at a one-to-one mapping that may streamline resource allocation but also raises concerns about flexibility in scaling individual components. This setup might be optimized for specific workloads, yet it risks potential bottlenecks if service demands increase without corresponding enhancements to associated resources. Furthermore, operating across three environments indicates a structured approach towards development lifecycle management, potentially supporting continuous integration and deployment practices. However, this multi-environment strategy could introduce complexities in configuration and synchronization, necessitating robust monitoring and orchestration mechanisms to mitigate the risk of discrepancies between environments. Overall, while the architecture appears well-structured for its domain requirements, attention should be given to ensuring scalability and maintaining consistency across platforms and environments.

This is a quick summary pulled from the compiled model. Use the links in the next section to get to the right place fast.

| Key | Value |
| --- | ----- |
| Application | Inventory Hub |
| Type | saas-platform |
| Domain | Inventory management and auditability |
| Hosting | public-cloud — Runs primarily on a public cloud provider (AWS/Azure/GCP). |
| Service Model | SaaS — Software-as-a-Service (multi-tenant or single-tenant product delivered to customers). |
| Tenancy | multi-tenant — Multiple customers share resources with logical isolation (efficiency, requires strong controls). |
| Services | 5 |
| Resources | 5 |
| Environments | 3 |
| Zones | 4 |
| Entry Points (terminal) | 1 |
| Entry Auth (distinct) | oauth2 |

## Architecture

Focus on the mental model: boundaries, diagrams, ownership, and what ‘good’ looks like operationally.

- [Architecture Overview](architecture-overview.md): the canonical narrative + diagrams/links.
- [Ownership + Support](architecture-overview.md#ownership-support): escalation + coverage.
- [Toolchain Overview](architecture-overview.md#toolchain-overview): repo/build/deploy/work tracking defaults.
- [Source](inputs/flightplan.yaml): add annotations.architectureViews as a list of diagram links for instant orientation.

## Source Control & Repos

Figure out where code lives, how it’s reviewed, and how to find the repo for any service quickly.

- [Service Catalog](service-catalog/index.md): jump to per-service repos.
- [Generated](flightplan.compiled.json): services[*].repoUrl present for 0/5 service(s) (0 distinct repo URL(s)).
- [Default repo system](architecture-overview.md#toolchain-overview): [github-repos](https://github.com/XeoHealth).
- [Source](inputs/flightplan.yaml): (optional) add annotations.engineering.source_control (branching model, PR policy, required checks).

## How Code Gets to Production

> **Info: AI Insights**
>
> The FlightPlan architecture employs a structured three-stage environment flow—development (dev), staging, and production (prod)—which is a common practice designed to ensure code quality and reliability before deployment. This approach allows for isolated testing in each stage, minimizing risks associated with direct deployments to production. One notable architectural decision is the use of these distinct environments to sequentially validate code changes, which aids in catching bugs early in the dev environment and further validating functionality and integration in staging. However, this pattern also introduces potential bottlenecks if any stage experiences delays or issues, potentially stalling the entire deployment pipeline. Additionally, while this flow facilitates robust testing, it necessitates rigorous management of environment configurations to prevent discrepancies between stages that could lead to undetected errors being propagated into production. Ensuring consistency and maintaining up-to-date documentation across environments is crucial for mitigating these risks.

Understand the pipeline, the environments, and the release strategy so you can ship changes safely.

- [Deployment Alignment](deployment-alignment.md): intent vs deployed reality (use before large changes).
- [Architecture — Deployment + Delivery](architecture-overview.md#deployment-delivery): deployment topology + rollout/rollback.
- [Architecture — Environment Overview](architecture-overview.md#environment-overview): promotion flow + environment intent.
- [Source](inputs/flightplan.yaml): annotations.deployment.* (strategy/policy notes).
- [CI/build](architecture-overview.md#toolchain-overview): [github-actions](https://github.com/XeoHealth).
- [CD/deploy](architecture-overview.md#toolchain-overview): [octopus-deploy](architecture-overview.md#tooling-overview).
- [Environment flow](architecture-overview.md#environment-overview): dev → staging → prod.
- [deployment.migrationStrategy](inputs/flightplan.yaml): prefer backward-compatible, alternate expand-contract
- [deployment.rollbackStrategy](inputs/flightplan.yaml): automated on SLO burn
- [deployment.rolloutStrategy](inputs/flightplan.yaml): rolling
- [deployment.tlsTermination](inputs/flightplan.yaml): ingress controller
- [deployment.topology](inputs/flightplan.yaml): microservices, event-driven, batch

## Tech Stack & Runtimes

> **Info: AI Insights**
>
> The FlightPlan architecture report indicates a diverse technology stack with an emphasis on both frontend and backend technologies. React 18 is used in a single platform instance, suggesting its role as the primary UI framework for delivering a responsive user interface. This choice of React aligns well with modern web development practices, offering robust performance optimizations and a strong developer community for support.
>
> On the backend side, .NET 8 appears to be the dominant technology, implemented across two platforms, indicating its critical role in managing business logic or core services within the architecture. The presence of Python 3.12 in one platform suggests additional functionality that may leverage Python's strengths in data processing, automation, or scripting tasks.
>
> The distribution implies a microservices-oriented architecture, given five total services spread over seven platforms with varying technology stacks. This could introduce complexity regarding integration and consistency across services but also offers flexibility and scalability benefits. A notable risk here is the potential for operational overhead and challenges in maintaining seamless communication between disparate systems, especially considering one unknown platform/service. Ensuring robust API gateways or service meshes would be crucial to mitigate such risks and facilitate smooth inter-service interactions.
>
> Overall, this setup reflects a strategic blend of technologies tailored to leverage their respective strengths while posing integration challenges that need careful management.

Get an aggregated sense of what you’ll be building and running.

- Technology: dotnet (2), (unspecified) (1), python (1), react (1).
- Hosting Infrastructure=public-cloud.
- Resource types: database (2), external-service (1), object-storage (1), topic (1).

[Service Catalog](service-catalog/index.md): per-service platform/repo details if you need specifics.

## Data & State

> **Info: AI Insights**
>
> The FlightPlan architecture report indicates a resource distribution that highlights several key considerations for optimal performance and scalability. With the database allocated two resources, it underscores its critical role in handling significant transactional loads or complex queries essential to system functionality. The allocation of one resource each to topic, object-storage, and external-service suggests a balanced approach but also raises questions about potential bottlenecks. Specifically, the single resource for topics could limit scalability if message throughput increases substantially, as it may struggle under high load conditions without additional capacity.
>
> Moreover, assigning only one resource to both object storage and external services implies a reliance on these components that might introduce risks in terms of latency or availability issues if demand spikes or failures occur. This architecture decision reflects an underlying assumption about the current usage patterns which should be regularly reviewed as system demands evolve. It is crucial to monitor performance metrics closely to ensure that these allocations meet operational needs and allow for flexible scaling, particularly given the finite total resources available (five in total).

This is high leverage for new engineers: understand the system of record, classifications, and data movement before making changes.

- [Architecture — Data Usage](architecture-overview.md#data-usage): where classified data is stored/transmitted.
- [Security — External Exposure](security-overview.md#external-exposure): cross-check any externally exposed exports that carry classifications.
- [Generated](flightplan.compiled.json): classified exports=3, classified resources=5.
- [Source](inputs/flightplan.yaml): resources + dataClasses + annotations.dataGovernance.*.
- [System of record](inputs/flightplan.yaml): claims-db.
- Resources: database, external-service, object-storage, topic.
- [dataGovernance.compliance](inputs/flightplan.yaml): HIPAA
- [dataGovernance.deletionPolicy](inputs/flightplan.yaml): tenant offboarding workflow
- [dataGovernance.retentionPolicy](inputs/flightplan.yaml): 7 years
- [dataGovernance.systemOfRecord](inputs/flightplan.yaml): claims-db
- [PII/PHI warning](security-overview.md): treat classified data handling as a first-week priority (access, logging, minimization).

## Config, Secrets & Environments

Learn where configuration is defined, where secrets live, and what changes are safe in each environment.

- [Environment Overview](architecture-overview.md#environment-overview): environment intent + promotion paths.
- [Source](inputs/flightplan.yaml): environments + annotations.security.* / annotations.deployment.*.
- [Generated](flightplan.compiled.json): environments modeled=3.
- [Environment scoping](architecture-overview.md#environment-overview): dev → staging → prod.
- [Source](inputs/flightplan.yaml): consider adding annotations.security.secretsManagement (Vault, cloud secrets manager, etc).

## Observability & Debugging

Know what to look at when something breaks: logs, dashboards, traces, and the runbook path.

- [Architecture — Observability + Operations](architecture-overview.md#observability-ops): expectations + operating model.
- [Tooling overview](architecture-overview.md#tooling-overview): observability tools and URLs.
- [Source](inputs/flightplan.yaml): annotations.observability.* (logging/metrics/tracing/runbooks).
- [observability.logging](inputs/flightplan.yaml): structured JSON logs
- [observability.metrics](inputs/flightplan.yaml): RED + saturation
- [observability.tracing](inputs/flightplan.yaml): OpenTelemetry end-to-end

## Security & Access Basics

Get the basics right early: auth, authorization model, audit expectations, and what’s allowed to be public.

- [Security Overview](security-overview.md): full security analysis (exposure + trust boundaries).
- [Interfaces & Exposure](security-overview.md#external-exposure): externally exposed exports=2.
- [Trust Boundaries](security-overview.md#trust-boundary-analysis): cross-zone calls and violations.
- [Entry points](service-catalog/index.md#entry-points): auth types observed: oauth2.
- [Generated](flightplan.compiled.json): services in public zone (best-effort)=1.
- [Source](inputs/flightplan.yaml): annotations.security.* for authn/authz/audit/encryption details.
- [security.auditLogging](inputs/flightplan.yaml): all claim access + admin actions
- [security.authModel](inputs/flightplan.yaml): Users are authenticated by MFA; gateway validates JWT
- [security.authorizationModel](inputs/flightplan.yaml): RBAC + tenant-scoped claims
- [security.encryptionAtRest](inputs/flightplan.yaml): AES-256 managed keys
- [security.encryptionInTransit](inputs/flightplan.yaml): TLS 1.2+ everywhere

## Working with Flight Plan (this repo)

Use these commands to validate the model and regenerate the published docs. If you’re looking at published output, start at the table of contents.

- Open [published reports](index.md).
- Browse [compiled plan JSON](flightplan.compiled.json) for machine-readable structure.

```bash
# Validate the YAML model
flightplan verify ./flightplan.yaml

# Generate reports (HTML)
flightplan publish ./flightplan.yaml --format html -o ./publish --overwrite
```

Source-of-truth inputs are the YAML files (including any referenced via uses). The publish output includes a compiled JSON representation plus generated reports.

