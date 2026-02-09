# Published Flight Plan Reports

> Table of contents for generated outputs

<details>
<summary>Metadata</summary>

- **Application:** Shopping Sample App
- **Version:** 
- **format:** text

</details>

---

## Overview

This publish output contains a compiled plan plus multiple reports. Use the links below to navigate.

### Reports

| Report | What it is |
| --- | --- |
| [Architecture](architecture-overview.md) | Design-time architecture overview |
| [Security](security-overview.md) | Design-time security/compliance overview |
| [Onboarding](developer-onboarding.md) | Developer orientation guide (entry points, owners, repos, deployment processes) |
| [Service Catalog](service-catalog/index.md) | Detailed inventory of services, interfaces, and dependencies |
| [Resource Catalog](resource-catalog/index.md) | Detailed inventory of resources, consumers, and configuration |

### Machine-Readable Output

| Output | What it is |
| --- | --- |
| [Compiled Plan](flightplan.compiled.json) | Machine-readable compiled plan (build output) |
| [Findings](findings.json) | Aggregated machine-readable findings across all reports |

## Findings

> **Info: Aggregated executive summary**
>
> Total: 5 (High: 1, Medium: 2, Low: 2, Info: 0).

- [High] ([security-overview](security-overview.md#third-party-dependencies)) Classified data sent to third-party systems: 1 third-party resource(s) are marked as handling classified data. Validate vendor risk, DPAs, and data minimization.
- [Medium] ([security-overview](security-overview.md#external-exposure)) Externally exposed interfaces: 2 export(s) are marked as externally exposed. Review authentication, authorization, and rate limiting.
- [Medium] ([security-overview](security-overview.md#trust-boundary-analysis)) Trust boundary crossings: 6 interaction(s) cross zone boundaries. Review identity propagation, encryption in transit, and authorization between zones.
- [Low] ([architecture-overview](architecture-overview.md#service-overview)) Services missing repo URL: 4 service(s) do not declare a repoUrl. Adding repo links improves traceability for ownership, releases, and incident response.
- [Low] ([service-catalog](service-catalog/index.md#service-catalog)) Services missing repo URL: 4 service(s) do not declare a repoUrl.

See the Findings JSON output for full detail and evidence.

