# minikube-setup
Local Development Environment

# OSX

## Hyperkit
```
brew install hyperkit
brew install minikube
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
  
