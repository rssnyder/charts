# ff-proxy Helm Chart

Helm chart to deploy a Harness Feature Flags v2r Relay Proxy

## Install

Configure the helm repository:
```
`helm repo add rssnyder https://rssnyder.github.io/charts`
```

Update the repository:
```
helm repo update rssnyder
```

Install the v2 proxy:

The minimum configuration needed is:
- A [proxy key](https://developer.harness.io/docs/feature-flags/relay-proxy/relay_proxy_v2/#creating-a-proxy-key)
- An auth secret (a random string, used to encrypt connection between your SDK (applications) and the proxy)
- The address of a redis server

```
helm upgrade -i ff-proxy --namespace ff-proxy --create-namespace \
  rssnyder/ff-proxy \
  --set proxyKey=xxxx-xxx-xxx-xxxx \
  --set authSecret=xxxx-xxx-xxx-xxxx \
  --set redisAddress=redis:6379
```

After install/upgrade the helm notes will display information on how to retrieve the proxy URL for your configuration for use with the SDK.

```
Use http://127.0.0.1:8080 as your relay proxy URL
```

## Uninstall

To remove the proxy run:
```
helm uninstall --namespace ff-proxy ff-proxy
```

### Configuration

Please read the [v2 Proxy documentation](https://developer.harness.io/docs/feature-flags/relay-proxy/relay_proxy_v2) for a detailed explanation of all configuration options.

Then see `values.yaml` for an extensive list of both proxy and Kubernetes configurations available.

By default the proxy will deploy with one writer and one read replica.
