Challenge 1: 

Commands to create the bridge network

docker network create --driver bridge sql-net 

docker run -p 8080:80 --network sql-net -e SQL_SERVER=localhost -e SQL_DBNAME=mydrivingDB -e SQL_USER=sa -e SQL_PASSWORD=1234root* -e ASPNETCORE_ENVIRONMENT=Local poi 

docker run --net sql-net -d -p 8080:80 -e SQL_SERVER=sql1 -e SQL_DBNAME=mydrivingDB -e SQL_USER=sa -e SQL_PASSWORD=1234root* -e ASPNETCORE_ENVIRONMENT=Local poi 

Challenge 2: 

Commands to create the deployment.yml file template: 

kubectl create deployment poi --image registryara0984.azurecr.io/poi:latest --dry-run=client -o yaml > poi.yaml 
 
kubectl create deployment trips --image registryara0984.azurecr.io/trips:latest --dry-run=client -o yaml > trips.yaml 

kubectl create deployment tripviewer --image registryara0984.azurecr.io/tripviewer:latest --dry-run=client -o yaml > tripviewer.yaml 

kubectl create deployment user-java --image registryara0984.azurecr.io/user-java:latest --dry-run=client -o yaml > user-java.yaml 

kubectl create deployment userprofile --image registryara0984.azurecr.io/userprofile:latest --dry-run=client -o yaml > userprofile.yaml 

Command to create or update the deployed resource: 

kubectl apply -f userprofile.yaml
kubectl apply -f user-java.yaml
kubectl apply -f trips.yaml
kubectl apply -f poi.yaml
kubectl apply -f tripviewer.yaml

Add secrets to the Cluster 

kubectl create secret generic sql-db-account --from-literal=SQL_USER=sqladminaRa0984 --from-literal=SQL_PASSWORD=demo!pass123 

kubectl create secret generic sql-db-account --from-literal=SQL_USER=sqladminaRa0984 --from-literal=SQL_PASSWORD=demo!pass123 --namespace api-dev 

if you have any problem trying access a resource inside a cluster with RBAC you may need to assign the following role to you account "Azure Kubernetes Service RBAC Cluster Admin"