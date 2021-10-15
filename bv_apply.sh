#! bin/bash

cd gcp 
terraform init
terraform apply --auto-approve
gcloud container clusters get-credentials bv-container-cluster --region us-central1 --project boa-vista-320713
cd ..

cd kubernetes
kubectl apply -f bv_components.yaml
kubectl apply -f bv_configmap.yaml
kubectl apply -f bv_deployment.yaml
kubectl apply -f bv_hpa.yaml
kubectl apply -f bv_service.yaml
cd ..

# cd observability
# kubectl apply -f bv_clusterRole.yaml
# kubectl apply -f bv_clusterRoleBinding.yaml
# kubectl apply -f bv_deployments.yaml
# kubectl apply -f bv_configMap.yaml
# kubectl apply -f bv_service.yaml
# kubectl apply -f bv_serviceAccount.yaml

echo "\nDeployment realizado com sucesso!\n"