# harness-ccm-autostopping

helm chart for the kubernetes autostopping controller and router

this chart deploys the components in red
![image](https://github.com/rssnyder/harness-ccm-autostopping/assets/7338312/26308903-90a4-4348-8381-36d61a4beec5)

## usage

> :warning: You must have the target cluster set up in Harness with a K8s and CCM K8s connector before you deploy this chart

install repo
`helm repo add rssnyder https://rssnyder.github.io/charts`

update repo
`helm repo update rssnyder`

deploy chart (you must set your namespace to `harness-autostopping`)
```
helm upgrade -i harness-autostopping --namespace harness-autostopping --create-namespace \
  rssnyder/harness-ccm-autostopping \
  --set accountId=wlgELJ0TTre5aZhzpt8gVA \
  --set connectorId=_lab_ccm \
  --set apiToken=sat.wlgELJ0TTre5aZhzpt8gVA.xxxxxxxxxxxx
```

- accountId: your Harness account ID
- connectorId: the ID for the CCM K8s connector for this cluster
- apiToken: a Harness API key with at least ccm:admin for all account level resources

## troubleshooting

to turn on debug logging, you can set the following values:
```yaml
router.logLevel: debug
```

## development notes

things that must be hard-coded:

namespace: `harness-autostopping`

service name for router: `autostopping-router`

service name for controller: `autostopping-controller` (therefor also hard-coded in the router configmap)

deployment name for controller: `autostopping-controller`

configmap: `harness-autostopping-enforcement`

secret name for api key: `harness-api-key`