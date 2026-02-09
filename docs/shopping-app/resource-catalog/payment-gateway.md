# Resource: payment-gateway

> Resource catalog detail

<details>
<summary>Metadata</summary>

- **Application:** Shopping Sample App
- **Version:** flightplan/v1
- **report:** resource-catalog
- **generated-by:** flightplan
- **resource:** payment-gateway

</details>

---

## Resource: payment-gateway

Back to [Resource Catalog](index.md).

Kind: external-service · Owner: backend · Platform: stripe/payments · Zone: external.

### Dependency graph

Services that depend on this resource.

```mermaid
flowchart LR
res_payment_gateway["payment-gateway<br/>external-service"]
svc_orders["orders"]
svc_orders -->|uses| res_payment_gateway
```

### Consumers (1)

| Service | Access | Details |
| --- | --- | --- |
| orders |  | cross-zone (service in internal, resource in external) |

