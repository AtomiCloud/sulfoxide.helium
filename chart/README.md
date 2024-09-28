# sulfoxide-helium

![Version: 1.9.0](https://img.shields.io/badge/Version-1.9.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 5.51.2](https://img.shields.io/badge/AppVersion-5.51.2-informational?style=flat-square)

AtomiCloud's Deployment Platform via ArgoCD

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://argoproj.github.io/argo-helm | argo-cd | 7.4.2 |
| oci://ghcr.io/atomicloud/sulfoxide.bromine | sulfoxide-bromine | 1.5.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| admin | bool | `true` | Enable Admin Access |
| applicationWait | bool | `true` | Enable waiting in sync-waves |
| argo-cd | object | `{"applicationSet":{"replicas":1},"configs":{"cm":{"create":false},"params":{"create":false},"rbac":{"create":false}},"controller":{"replicas":3,"resources":{"limits":{"cpu":"3000m","memory":"3000Mi"},"requests":{"cpu":"1500m","memory":"1500Mi"}}},"dex":{"enabled":false},"global":{"logging":{"format":"json","level":"info"}},"redis":{"resources":{"limits":{"cpu":"500m","memory":"512Mi"},"requests":{"cpu":"250m","memory":"256Mi"}}},"repoServer":{"replicas":2,"resources":{"limits":{"cpu":"1000m","memory":"1000Mi"},"requests":{"cpu":"500m","memory":"500Mi"}}},"server":{"replicas":2,"resources":{"limits":{"cpu":"500m","memory":"512Mi"},"requests":{"cpu":"250m","memory":"256Mi"}}}}` | ArgoCD Specific configuration. See [ArgoCD Helm Documentation](https://github.com/argoproj/argo-helm/tree/main/charts/argo-cd) |
| banner | string | `""` | Banner to show in ArgoCD UI |
| connector | object | `{"clusters":{},"policy":{"creation":"Owner","deletion":"Retain"},"secretStore":{"kind":"SecretStore","name":"helium"}}` | Connectors to other cluster |
| connector.clusters | object | `{}` | Clusters to connect to |
| connector.policy | object | `{"creation":"Owner","deletion":"Retain"}` | External Secret Policy |
| connector.policy.creation | string | `"Owner"` | Creation policy |
| connector.policy.deletion | string | `"Retain"` | Deletion policy |
| connector.secretStore.kind | string | `"SecretStore"` | Kind of the Secret Store: `ClusterSecretStore` or `SecretStore` |
| connector.secretStore.name | string | `"helium"` | Name of the Secret Store |
| exec | bool | `true` | Enable Exec in ArgoCD |
| github | object | `{"external":{"enable":true,"passwordRef":"","policy":{"creation":"Owner","deletion":"Retain"},"refreshInterval":"1h","secretStore":{"kind":"SecretStore","name":"helium"},"usernameRef":""},"internal":{"enable":false,"password":"","username":""},"secretName":"argo-cd-creds","type":"","url":""}` | GitHub Auth Setup |
| github.external | object | `{"enable":true,"passwordRef":"","policy":{"creation":"Owner","deletion":"Retain"},"refreshInterval":"1h","secretStore":{"kind":"SecretStore","name":"helium"},"usernameRef":""}` | External Secrets |
| github.external.enable | bool | `true` | Enable External Secrets |
| github.external.passwordRef | string | `""` | Password Remote Reference |
| github.external.policy | object | `{"creation":"Owner","deletion":"Retain"}` | External Secret Policy |
| github.external.policy.creation | string | `"Owner"` | Creation Policy |
| github.external.policy.deletion | string | `"Retain"` | Deletion Policy |
| github.external.refreshInterval | string | `"1h"` | Refresh Interval for fetching the secret from remote |
| github.external.secretStore.kind | string | `"SecretStore"` | Kind of the Secret Store: `ClusterSecretStore` or `SecretStore` |
| github.external.secretStore.name | string | `"helium"` | Name of the Secret Store |
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
| radon | object | `{"appName":"radon","enable":true,"path":"chart","releaseName":"radon","repoURL":"https://github.com/AtomiCloud/sulfoxide.radon","targetRevision":"HEAD","values":["values.yaml","values.entei.opal-ruby.yaml"]}` | ApplicationSets for L2 Applications |
| radon.appName | string | `"radon"` | App name of the App of ApplicationSets |
| radon.enable | bool | `true` | Enable ApplicationSets for L2 Applications |
| radon.path | string | `"chart"` | Path in the repository that poitns to the helm chart |
| radon.releaseName | string | `"radon"` | Release name for Radon |
| radon.repoURL | string | `"https://github.com/AtomiCloud/sulfoxide.radon"` | Radon helm chart repository |
| radon.targetRevision | string | `"HEAD"` | Version for Radon to deploy |
| radon.values | list | `["values.yaml","values.entei.opal-ruby.yaml"]` | values to use for the helm chart |
| rbac | object | `{"clientID":"","enable":true,"group":"https://atomi.cloud/roles","issuer":"https://atomicloud-internal.jp.auth0.com/","name":"Atomi","requestedScopes":["openid","profile","email","https://atomi.cloud/roles"]}` | RBAC Setup |
| rbac.clientID | string | `""` | Client ID for OIDC |
| rbac.enable | bool | `true` | Enable of RBAC |
| rbac.group | string | `"https://atomi.cloud/roles"` | Group claim to use for OIDC for RBAC |
| rbac.issuer | string | `"https://atomicloud-internal.jp.auth0.com/"` | Name of OIDC Issuer |
| rbac.name | string | `"Atomi"` | Name of the OIDC Provider |
| rbac.requestedScopes | list | `["openid","profile","email","https://atomi.cloud/roles"]` | Scopes to request from OIDC |
| serviceTree | object | `{"layer":"1","platform":"sulfoxide","service":"chlorine"}` | AtomiCloud Service Tree. See [ServiceTree](https://atomicloud.larksuite.com/wiki/OkfJwTXGFiMJkrk6W3RuwRrZs64?theme=DARK&contentTheme=DARK#MHw5d76uDo2tBLx86cduFQMRsBb) |
| sso | object | `{"external":{"enable":true,"policy":{"creation":"Owner","deletion":"Retain"},"refreshInterval":"1h","remoteSecretName":"","secretStore":{"kind":"ClusterStore","name":"helium"}},"internal":{"enable":false,"secret":""},"secretName":"argo-cd-sso-secret"}` | SSO Secret using OIDC |
| sso.external | object | `{"enable":true,"policy":{"creation":"Owner","deletion":"Retain"},"refreshInterval":"1h","remoteSecretName":"","secretStore":{"kind":"ClusterStore","name":"helium"}}` | External Secret Configuration |
| sso.external.enable | bool | `true` | Enable External Secret |
| sso.external.policy | object | `{"creation":"Owner","deletion":"Retain"}` | External Secret Policy |
| sso.external.policy.creation | string | `"Owner"` | Creation policy |
| sso.external.policy.deletion | string | `"Retain"` | Deletion policy |
| sso.external.refreshInterval | string | `"1h"` | Refresh Interval for fetching the secret from remote |
| sso.external.remoteSecretName | string | `""` | Secret Remote Reference for OIDC Client Secret |
| sso.external.secretStore.kind | string | `"ClusterStore"` | Kind of the Secret Store: `ClusterSecretStore` or `SecretStore` |
| sso.external.secretStore.name | string | `"helium"` | Name of the Secret Store |
| sso.internal | object | `{"enable":false,"secret":""}` | Internal Secret, Hard coded secrets |
| sso.internal.enable | bool | `false` | Enable Internal Secret |
| sso.internal.secret | string | `""` | Secret for SSO |
| sso.secretName | string | `"argo-cd-sso-secret"` | Secret Name of SSO Secret |
| sulfoxide-bromine | object | `{"annotations":{"helm.sh/hook":"pre-install,pre-upgrade","helm.sh/weight":"-5"},"rootSecret":{"name":"chlorine","ref":{"clientId":"SULFOXIDE_HELIUM_CLIENT_ID","clientSecret":"SULFOXIDE_HELIUM_CLIENT_SECRET"}},"serviceTree":{"platform":"sulfoxide","service":"chlorine"},"storeName":"chlorine"}` | Create SecretStore via secret of secrets pattern |
| sulfoxide-bromine.rootSecret | object | `{"name":"chlorine","ref":{"clientId":"SULFOXIDE_HELIUM_CLIENT_ID","clientSecret":"SULFOXIDE_HELIUM_CLIENT_SECRET"}}` | Secret of Secrets reference |
| sulfoxide-bromine.rootSecret.ref | object | `{"clientId":"SULFOXIDE_HELIUM_CLIENT_ID","clientSecret":"SULFOXIDE_HELIUM_CLIENT_SECRET"}` | Infisical Token Reference |
| sulfoxide-bromine.storeName | string | `"chlorine"` | Store name to create |
| url | string | `"https://deploy.atomi.cloud"` | URL of ArgoCD endpoint |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
