# harness-ccm-cluster-orchestrator

helm chart for the ccm cluster orchestrator

## usage

> :warning: You must have the target cluster set up in Harness with a K8s and CCM K8s connector before you deploy this chart

install repo
`helm repo add rssnyder https://rssnyder.github.io/charts`

update repo
`helm repo update rssnyder`

deploy chart (you must set your namespace to `harness-ccm`)

```
helm upgrade -i harness-cluster-orch --namespace harness-ccm --create-namespace \
  rssnyder/harness-ccm-cluster-orchestrator \
  --set clusterName=rileysnyder \
  --set clusterRegion=us-west-2 \
  --set remoteAccountID=AM8HCbDiTXGQNrTIhNl7qQ \
  --set connectorID=rileysnyder_temp_infraCostaccess \
  --set clusterID=orch-cr68d03saq0vrda3njs0 \
  --set "harnessAPI=https://app.harness.io/gratis/lw/api" \
  --set "clusterEndpoint=https://xxx.gr7.us-west-2.eks.amazonaws.com" \
  --set awsDefaultInstanceProfile=eks-92c8bfe4-4afb-bbc4-2965-8f07280fdc31 \
  --set "awsNodeRoleARN=arn:aws:iam::759984737373:role/default-eks-node-group-20240823145811164700000003" \
  --set "controllerRoleArn=arn:aws:iam::759984737373:role/ccm_comm_orch_controller" \
  --set "apiToken=sat.AM8HCbDiTXGQNrTIhNl7qQ.xxx"
```

all values are described in `values.yaml`

## development notes

things that must be hard-coded:

namespace: `harness-ccm`
