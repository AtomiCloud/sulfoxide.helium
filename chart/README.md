# sulfoxide-helium

![Version: 1.3.0](https://img.shields.io/badge/Version-1.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 5.46.7](https://img.shields.io/badge/AppVersion-5.46.7-informational?style=flat-square)

AtomiCloud's Deployment Platform via ArgoCD

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://argoproj.github.io/argo-helm | argo-cd | 5.46.7 |
| oci://ghcr.io/atomicloud/sulfoxide.bromine | sulfoxide-bromine | 1.2.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| admin | bool | `true` | Enable Admin Access |
| applicationWait | bool | `true` | Enable waiting in sync-waves |
| argo-cd | object | `{"configs":{"cm":{"create":false},"params":{"create":false},"rbac":{"create":false}},"dex":{"enabled":false},"global":{"logging":{"format":"json","level":"info"}}}` | ArgoCD Specific configuration. See [ArgoCD Helm Documentation](https://github.com/argoproj/argo-helm/tree/main/charts/argo-cd) |
| banner | string | `""` | Banner to show in ArgoCD UI |
| connector | object | `{"clusters":{},"policy":{"creation":"Owner","deletion":"Retain"},"secretStore":{"kind":"SecretStore","name":"doppler"}}` | Connectors to other cluster |
| connector.clusters | object | `{}` | Clusters to connect to |
| connector.policy | object | `{"creation":"Owner","deletion":"Retain"}` | External Secret Policy |
| connector.policy.creation | string | `"Owner"` | Creation policy |
| connector.policy.deletion | string | `"Retain"` | Deletion policy |
| connector.secretStore.kind | string | `"SecretStore"` | Kind of the Secret Store: `ClusterSecretStore` or `SecretStore` |
| connector.secretStore.name | string | `"doppler"` | Name of the Secret Store |
| exec | bool | `true` | Enable Exec in ArgoCD |
| github | object | `{"external":{"enable":true,"passwordRef":"","policy":{"creation":"Owner","deletion":"Retain"},"refreshInterval":"1h","secretStore":{"kind":"SecretStore","name":"doppler"},"usernameRef":""},"internal":{"enable":false,"password":"","username":""},"secretName":"argo-cd-creds","type":"","url":""}` | GitHub Auth Setup |
| github.external | object | `{"enable":true,"passwordRef":"","policy":{"creation":"Owner","deletion":"Retain"},"refreshInterval":"1h","secretStore":{"kind":"SecretStore","name":"doppler"},"usernameRef":""}` | External Secrets |
| github.external.enable | bool | `true` | Enable External Secrets |
| github.external.passwordRef | string | `""` | Password Remote Reference |
| github.external.policy | object | `{"creation":"Owner","deletion":"Retain"}` | External Secret Policy |
| github.external.policy.creation | string | `"Owner"` | Creation Policy |
| github.external.policy.deletion | string | `"Retain"` | Deletion Policy |
| github.external.refreshInterval | string | `"1h"` | Refresh Interval for fetching the secret from remote |
| github.external.secretStore.kind | string | `"SecretStore"` | Kind of the Secret Store: `ClusterSecretStore` or `SecretStore` |
| github.external.secretStore.name | string | `"doppler"` | Name of the Secret Store |
| github.external.usernameRef | string | `""` | Username Remote Reference |
| github.internal | object | `{"enable":false,"password":"","username":""}` | Internal Secret, Hard coded secrets |
| github.internal.enable | bool | `false` | Enable Internal Secret |
| github.internal.password | string | `""` | Password for Github Auth |
| github.internal.username | string | `""` | Username for Github Auth |
| github.secretName | string | `"argo-cd-creds"` | Secret name of Github Auth |
| github.type | string | `""` | ArgoCD Credential Type |
| github.url | string | `""` | ArgoCD Credential Type |
| helm | bool | `true` | Enable Helm Application |
| jsonnet | bool | `true` | Enable JSONNET Application |
| kustomize | bool | `true` | Enable Kustomize Application |
| otelAddress | string | `""` | OTEL Collector Endpoint |
| projects | object | `{"bootstrap":{"desc":"Bootstrap Project used to setup the cluster"}}` | Projects to create in ArgoCD |
| rbac | object | `{"clientID":"","enable":true,"group":"https://atomi.cloud/roles","issuer":"https://atomicloud-internal.jp.auth0.com/","name":"Atomi","requestedScopes":["openid","profile","email","https://atomi.cloud/roles"]}` | RBAC Setup |
| rbac.clientID | string | `""` | Client ID for OIDC |
| rbac.enable | bool | `true` | Enable of RBAC |
| rbac.group | string | `"https://atomi.cloud/roles"` | Group claim to use for OIDC for RBAC |
| rbac.issuer | string | `"https://atomicloud-internal.jp.auth0.com/"` | Name of OIDC Issuer |
| rbac.name | string | `"Atomi"` | Name of the OIDC Provider |
| rbac.requestedScopes | list | `["openid","profile","email","https://atomi.cloud/roles"]` | Scopes to request from OIDC |
| serviceTree | object | `{"layer":"1","platform":"sulfoxide","service":"chlorine"}` | AtomiCloud Service Tree. See [ServiceTree](https://atomicloud.larksuite.com/wiki/OkfJwTXGFiMJkrk6W3RuwRrZs64?theme=DARK&contentTheme=DARK#MHw5d76uDo2tBLx86cduFQMRsBb) |
| sso | object | `{"external":{"enable":true,"policy":{"creation":"Owner","deletion":"Retain"},"refreshInterval":"1h","remoteSecretName":"","secretStore":{"kind":"ClusterStore","name":"doppler"}},"internal":{"enable":false,"secret":""},"secretName":"argo-cd-sso-secret"}` | SSO Secret using OIDC |
| sso.external | object | `{"enable":true,"policy":{"creation":"Owner","deletion":"Retain"},"refreshInterval":"1h","remoteSecretName":"","secretStore":{"kind":"ClusterStore","name":"doppler"}}` | External Secret Configuration |
| sso.external.enable | bool | `true` | Enable External Secret |
| sso.external.policy | object | `{"creation":"Owner","deletion":"Retain"}` | External Secret Policy |
| sso.external.policy.creation | string | `"Owner"` | Creation policy |
| sso.external.policy.deletion | string | `"Retain"` | Deletion policy |
| sso.external.refreshInterval | string | `"1h"` | Refresh Interval for fetching the secret from remote |
| sso.external.remoteSecretName | string | `""` | Secret Remote Reference for OIDC Client Secret |
| sso.external.secretStore.kind | string | `"ClusterStore"` | Kind of the Secret Store: `ClusterSecretStore` or `SecretStore` |
| sso.external.secretStore.name | string | `"doppler"` | Name of the Secret Store |
| sso.internal | object | `{"enable":false,"secret":""}` | Internal Secret, Hard coded secrets |
| sso.internal.enable | bool | `false` | Enable Internal Secret |
| sso.internal.secret | string | `""` | Secret for SSO |
| sso.secretName | string | `"argo-cd-sso-secret"` | Secret Name of SSO Secret |
| sulfoxide-bromine | object | `{"annotations":{"helm.sh/hook":"pre-install,pre-upgrade","helm.sh/weight":"-5"},"rootSecret":{"ref":"SULFOXIDE_HELIUM"},"storeName":"doppler"}` | Create SecretStore via secret of secrets pattern |
| sulfoxide-bromine.rootSecret | object | `{"ref":"SULFOXIDE_HELIUM"}` | Secret of Secrets reference |
| sulfoxide-bromine.rootSecret.ref | string | `"SULFOXIDE_HELIUM"` | DOPPLER Token Reference |
| sulfoxide-bromine.storeName | string | `"doppler"` | Store name to create |
| url | string | `"https://deploy.atomi.cloud"` | URL of ArgoCD endpoint |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.1](https://github.com/norwoodj/helm-docs/releases/v1.11.1)