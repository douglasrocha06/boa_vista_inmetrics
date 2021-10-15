#! bin/bash

gcloud container clusters get-credentials bv-container-cluster --region us-central1 --project boa-vista-320713
kubectl apply -f bv_components.yaml
kubectl apply -f bv_configmap.yaml
kubectl apply -f bv_deployment.yaml
kubectl apply -f bv_service.yaml
kubectl apply -f bv_hpa.yaml

kubectl get all

echo "Deployment realizado com sucesso!"