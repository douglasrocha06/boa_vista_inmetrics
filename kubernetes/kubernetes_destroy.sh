#! bin/bash

kubectl delete all --all
kubectl delete configmap --all
kubectl delete -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
# kubectl delete -f istio/samples/addons
# istioctl manifest generate --set profile=demo | kubectl delete --ignore-not-found=true -f -

kubectl get all

echo "Destroy realizado com sucesso!"