# Minikube Setup
Local Development Environment with minikube.

# Brew Installation Packages
```
brew install shyiko/kubesec/kubesec
brew install sops
brew install gnupg
brew install hyperkit
brew install minikube
brew install 
brew install dive
brew install skopeo
brew install httpie
brew install stern
brew install helm
brew install kustomize 
brew install skaffold
```

# OSX
## Hyperkit
```
minikube config set driver hyperkit
```

## Minikube Addons
```
minikube addons enable dashboard
minikube addons enable metrics-server
minikube addons enable ingress
minikube addons enable registry
```

# Helm Repos
```
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
```
  
# Helm Install 
```
helm install prometheus prometheus-community/kube-prometheus-stack
helm install mongodb --set architecture=replicaset bitnami/mongodb
helm install redis bitnami/redis
```  

# Connect to MongoDB with Robo3T
## Get Password
```
kubectl get secret --namespace default mongodb -o jsonpath="{.data.mongodb-root-password}" | base64 --decode
```
## Port Forward
```
kubectl port-forward services/mongodb-headless 27017:27017
```
## Configure MongoDB Connection
![](./img/Robo3T-1.png =250x)
![](./img/Robo3T-2.png =250x)


# Minikube Tips
## Dashboard
```
minikube dashboard &
```
## Get URL
```
minikube service partner-service --url
```

## Call Service
```
http $(minikube service partner-service --url)forwarded:for='minikube.me;host=minikube.me' "Authorization: Bearer $TOKEN"
```
