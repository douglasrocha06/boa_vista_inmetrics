#! bin/bash

kubectl delete -f ./kubernetes
# kubectl delete -f ./observability

cd gcp 

terraform init
terraform destroy --auto-approve

echo "\nDestroy realizado com sucesso!\n"