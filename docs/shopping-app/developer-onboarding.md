# Developer Onboarding

> Step-by-step orientation guide for engineers new to the system

<details>
<summary>Metadata</summary>

- **Application:** Shopping Sample App
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
> The Shopping Sample App architecture presents a moderately complex system with four services distributed across six platforms in three different environments. This configuration suggests a scalable approach to application deployment, allowing for flexibility and adaptability across various operational contexts. However, it also introduces potential complexities in maintaining consistency and managing dependencies between services and platforms. With only three resources mentioned, there is an implicit reliance on these components being robust enough to support the diverse platform requirements without bottlenecks or resource contention.
>
> A notable architectural decision here is the division of application functionality across four distinct services. This microservices architecture can offer benefits such as isolated service failures reducing overall system risk and enhanced scalability for individual components. However, it also poses challenges in ensuring seamless communication and data consistency among services, particularly when deployed across multiple platforms and environments. The multi-environment setup further complicates integration testing and continuous deployment processes, requiring meticulous orchestration to avoid drift between development, staging, and production environments.
>
> Potential risks include increased operational overhead due to the need for comprehensive monitoring and logging across varied platforms and service interactions. Additionally, with a small number of resources supporting multiple services and environments, there's a risk of resource saturation or single points of failure that could impact system availability and performance. Ensuring robust failover mechanisms and load balancing strategies will be crucial in mitigating these risks while maintaining high levels of reliability and user satisfaction.

This is a quick summary pulled from the compiled model. Use the links in the next section to get to the right place fast.

| Key | Value |
| --- | ----- |
| Application | Shopping Sample App |
| Services | 4 |
| Resources | 3 |
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
- [Generated](flightplan.compiled.json): services[*].repoUrl present for 0/4 service(s) (0 distinct repo URL(s)).
- [Source](inputs/flightplan.yaml): (optional) add annotations.engineering.source_control (branching model, PR policy, required checks).

## How Code Gets to Production

> **Info: AI Insights**
>
> The FlightPlan architecture report outlines a three-stage environment flow for code deployment: development (dev), staging, and production (prod). This pipeline is designed to ensure progressive validation of code changes before reaching production. A critical pattern observed here is the incremental testing and verification at each stage, which helps in isolating issues early in the dev phase and further refining them during the staging phase before they affect end users in prod. However, this architecture presents potential risks such as bottlenecks if any environment experiences prolonged deployment times or resource limitations, potentially delaying the release cycle. Moreover, the separation of environments necessitates robust automation for testing and deployment to maintain efficiency. Notable architectural decisions include the requirement for a comprehensive CI/CD pipeline that can handle automated testing and seamless transitions between these environments, ensuring high reliability and minimizing manual intervention during deployments. Additionally, considerations around rollback strategies in case of failures at any stage are essential to safeguard production stability.

Understand the pipeline, the environments, and the release strategy so you can ship changes safely.

- [Deployment Alignment](deployment-alignment.md): intent vs deployed reality (use before large changes).
- [Architecture — Deployment + Delivery](architecture-overview.md#deployment-delivery): deployment topology + rollout/rollback.
- [Architecture — Environment Overview](architecture-overview.md#environment-overview): promotion flow + environment intent.
- [Source](inputs/flightplan.yaml): annotations.deployment.* (strategy/policy notes).
- [Environment flow](architecture-overview.md#environment-overview): dev → staging → prod.

## Tech Stack & Runtimes

> **Info: AI Insights**
>
> The FlightPlan architecture report reveals a tech stack that integrates Vue.js 3 for frontend development, .NET 8 for backend services, and Python 3.12, indicating a polyglot microservices approach across six platforms and four services. The choice of Vue.js as the sole JavaScript framework suggests a focus on building reactive user interfaces with a modern framework known for its simplicity and progressive nature. The dual usage of .NET 8 underscores a preference for robustness, security, and performance in service-oriented architectures, likely catering to complex backend logic or enterprise-level requirements. Python's inclusion at version 3.12 might be aimed at leveraging its extensive libraries for data processing or scripting tasks.
>
> This distribution suggests an architectural decision to capitalize on the strengths of each technology stack, with Vue.js handling client-side dynamics, .NET managing core business logic and security concerns, and Python addressing specific computational needs. However, this polyglot nature introduces challenges related to cross-language integration and potential overhead in maintaining diverse codebases across different platforms. Ensuring consistent performance and seamless interoperability between these varied environments will be critical, especially given the limited number of services (four) relative to the total platforms (six), which might indicate a complex deployment strategy or redundancy measures within the architecture.

Get an aggregated sense of what you’ll be building and running.

- Technology: dotnet (2), python (1), vue/3 (1).
- Hosting Infrastructure=(not specified).
- Resource types: database (1), external-service (1), queue (1).

[Service Catalog](service-catalog/index.md): per-service platform/repo details if you need specifics.

## Data & State

> **Info: AI Insights**
>
> The FlightPlan architecture report indicates a resource distribution model that allocates one unit each to database, queue, and external service. This balanced allocation suggests an intent to equally prioritize data storage, task management, and third-party integrations within the system's design. However, this equal distribution may also imply potential bottlenecks if any single component experiences higher-than-expected demand or performance issues since there are no excess resources allocated for scaling individual components. Such a setup could be indicative of an initial, small-scale deployment where each component is expected to handle a limited workload efficiently.
>
> Moreover, the uniform resource allocation points towards a microservices-style architecture where each service operates independently with dedicated resources, promoting scalability and fault isolation. Nevertheless, this approach carries inherent risks, such as increased complexity in managing multiple services and potential challenges in ensuring seamless communication between them. A notable architectural decision here is the reliance on an external service for part of its functionality, which introduces dependencies that could impact system reliability if not properly managed. This necessitates robust error handling and fallback mechanisms to maintain system resilience against third-party failures.

This is high leverage for new engineers: understand the system of record, classifications, and data movement before making changes.

- [Architecture — Data Usage](architecture-overview.md#data-usage): where classified data is stored/transmitted.
- [Security — External Exposure](security-overview.md#external-exposure): cross-check any externally exposed exports that carry classifications.
- [Generated](flightplan.compiled.json): classified exports=1, classified resources=3.
- [Source](inputs/flightplan.yaml): resources + dataClasses + annotations.dataGovernance.*.
- Resources: database, external-service, queue.
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
- [Source](inputs/flightplan.yaml): add annotations.observability (dashboards + runbooks) to make onboarding fast.

## Security & Access Basics

Get the basics right early: auth, authorization model, audit expectations, and what’s allowed to be public.

- [Security Overview](security-overview.md): full security analysis (exposure + trust boundaries).
- [Interfaces & Exposure](security-overview.md#external-exposure): externally exposed exports=2.
- [Trust Boundaries](security-overview.md#trust-boundary-analysis): cross-zone calls and violations.
- [Entry points](service-catalog/index.md#entry-points): auth types observed: oauth2.
- [Generated](flightplan.compiled.json): services in public zone (best-effort)=1.
- [Source](inputs/flightplan.yaml): annotations.security.* for authn/authz/audit/encryption details.

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

