# harness-ccm-autostopping

helm chart for components of the the kubernetes autostopping system

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


### cluster orchestrator

if you are also using cluster orchestrator, you will need to add annotations for spot nodes:
```yaml
discovery:
  tolerations:
    - effect: NoSchedule
      key: ccm.harness.io/spot-ready
      value: Ready
      effect: "NoSchedule"
```

## development notes

things that must be hard-coded:

namespace: `harness-autostopping`

deployment name for progress watcher: `progress-agent`

service name for controller: `autostopping-controller` (therefor also hard-coded in the router configmap)

deployment name for controller: `autostopping-controller`

configmap: `harness-autostopping-enforcement`

secret name for api key: `harness-api-key`
