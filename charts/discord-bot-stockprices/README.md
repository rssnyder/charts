# discord-bot-stockprices

## Install

```sh
helm repo add rssnyder https://rssnyder.github.io/charts
helm repo update rssnyder

helm upgrade -i stockprices --namespace stockprices --create-namespace \
  rssnyder/discord-bot-stockprices \
  --set token=xxxx-xxx-xxx-xxxx \
  --set symbol=MIDS.ST
```

Set `symbol` to a Yahoo Finance ticker, including its exchange suffix when needed.
