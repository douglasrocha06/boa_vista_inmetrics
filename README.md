# Desafios Boa Vista 
### Proposta do desafio I: Criar um conjunto de kubernetes com a seguinte estrutura.
- Um Deployment com duas réplicas usando hpa com readiness e liveness.
- Foi criado os conjunto solicitados, mais alguns recursos, sendo.
    - ClusterIP para comunicação do banco de dados com a aplicação.
    - NodePort para expor a aplicação para o mundo externo.
    - Deployment da aplicação.
    - HPA para escalonamento automántico com base nas métricas.
    - ConfigMap passando as configurações necessarias para funcionamento da aplicação.

### Proposta do desafio II: Criar alguns recursos na Google Cloud Plataform com Terraform.
- Utilização do IaC (Infraestrutura como Código).
- Foi realizado o provisionamento de um cluster com a aplicação do desafio I.
- Utilizando variáveis e outputs. 
- Criação de uma máquina virtual.

### Proposta do desafio III: Criação de Service Account no GCP e Kubernetes e amarrações.
- Criação de um namespace.
    - kubectl create namespace **<name_namespace>**
- Criação da service account no kubernetes.
    - kubectl create serviceaccount **<name_SA>**
- Anotação entre as duas service account.
    - kubectl annotate serviceaccount  **<name_SA>** iam.gke.io/gcp-service-account=**<SA_name_iam>**@**<project_id>**.iam.gserviceaccount.com
- Ativar a identidade da carga de trabalho no cluster.
    - gcloud container clusters update **<name_cluster>** \
    --workload-pool=**<project_id>**.svc.id.goog
- Amarração das duas service account.
    - gcloud iam service-accounts add-iam-policy-binding \
        --role roles/iam.workloadIdentityUser \
        --member "serviceAccount:**<project_id>**.svc.id.goog[default/**<name_SA>**]" \
        **<SA_name_iam>**@**<project_id>**.iam.gserviceaccount.com

### Proposta do desafio IIII: Utilização do Istio, Service Mesh e Kiali.
- Foi criado o deployment da aplicação, utilizando o Istio, e demonstrado o tráfego no painel do Kiali.

<img src="/images/painel_kiali.png" alt="kiali"/>

### Proposta do desafio V: Criação de um Observability
- Foi criado o deployment do prometheus, grafana e exibido as métricas de requisições da aplicação, e informações do cluster como quantidade de pods, service, utilização de cpu do cluster, e Horizontal Pod Autoscaling.

<img src="/images/Painel_1.png" alt="Painel 1"/>
<img src="/images/Painel_2.png" alt="Painel 2"/>

### Proposta do desafio VI: Provisionar a aplicação pelo terraform em um Cloud SQL no GCP.

- Foi criado uma instância do Cloud SQL, utilizando Terraform.

<img src="/images/CloudSQL.png" alt="CloudSQL1"/>
<img src="/images/CloudSQL_2.png" alt="CloudSQL2"/>