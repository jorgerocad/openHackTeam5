git clone https://github.com/NillsF/blog.git

#setup CSI Driver
helm repo add csi-secrets-store-provider-azure https://azure.github.io/secrets-store-csi-driver-provider-azure/charts
helm install csi csi-secrets-store-provider-azure/csi-secrets-store-provider-azure -n api

#crd is custom resource definition. in addition to pods, services etc, k8s also support crd
kubectl get crd

#deploy spc.yaml; Secret provider class.
## This SPC is an object in kubetnetes that will link the secrets in Azure Key Vault to something Kubernetes can use. 
kubectl apply -f spc-csi-mi-clientid.yaml -n api 
# this deploys a csi store provider and secrets store csi driver
kubectl get pods 

kubectl apply -f poi-csi-keyvault.yaml -n api

