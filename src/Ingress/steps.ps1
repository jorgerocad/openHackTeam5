
# Create Ingress Controller
Kubectl create namespace ingress

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

helm install ingress-nginx ingress-nginx/ingress-nginx --namespace ingress

kubectl --namespace ingress get services -o wide -w ingress-nginx-controller

## ingress-nginx-controller             LoadBalancer   10.0.55.177    20.81.29.115   80:31987/TCP,443:32094/TCP 
#Create Ingress Rules for Web and API ingress

#Ingress Rules documentation
https://kubernetes.io/docs/concepts/services-networking/ingress/

kubectl apply -f web-ingress.yaml -n web
kubectl apply -f api-ingress3.yaml -n api

