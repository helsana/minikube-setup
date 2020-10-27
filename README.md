# Minikube Setup
Local Development Environment with minikube.

# Brew Installation Packages
```
brew install shyiko/kubesec/kubesec
brew install sops
brew install gnupg
brew install hyperkit
brew install minikube
brew install watchbrew 
brew install jq
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
## Minikube Change CPUs and Memory 
```
minikube start --memory=8192 --cpus=4 --disk-size=100g

kubectl get node minikube -o jsonpath=‘{.status.capacity}’
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
![](image/Robo3T-1.png)
![](image/Robo3T-2.png)

# Minikube Tips
## Minikube IP
```
minikube ip
```

## Dashboard
```
minikube dashboard  & 
```
## Get URL
```
minikube service partner-service --url
```

## Call Service
```
http $(minikube service partner-service --url)forwarded:for='minikube.me;host=minikube.me' "Authorization: Bearer $TOKEN"
```

## Minikube Ingress Setup
/etc/hosts

To get on the service with the URL `minikube.me` we update now our local `/etc/hosts` file with IP address from the minikube IP.
Run the following command:
```
echo $(minikube ip) minikube.me | sudo tee -a /etc/hosts

Password:
192.168.64.11 minikube.me
```
Verify it the IP is in the /etc/hosts with the following command:
```
cat /etc/hosts | tail -n 1

192.168.64.11 minikube.me
```

### Deploy Ingress
```
echo "apiVersion: networking.k8s.io/v1beta1 # for versions before 1.14 use extensions/v1beta1
kind: Ingress
metadata:
 name: nginx-ingress
 namespace: default
 annotations:
   nginx.ingress.kubernetes.io/rewrite-target: /
spec:
 rules:
 - host: minikube.me
   http:
     paths:
     - path: /
       backend:
         serviceName: gateway-service
         servicePort: 8080
" | kubectl apply -f -
```
Or just apply the file in the ingress folder
```
kubectl apply -f ingress/nginx-ingress.yaml
```
### Check Ingress
```
kubectl get ingress
Warning: extensions/v1beta1 Ingress is deprecated in v1.14+, unavailable in v1.22+; use networking.k8s.io/v1 Ingress
NAME            CLASS    HOSTS         ADDRESS        PORTS   AGE
nginx-ingress   <none>   minikube.me   192.168.64.4   80      109s
```

# RBAC
To Read the `ConfigMaps` and `Secrets` with the [Spring Cloud Kubernetes](https://spring.io/projects/spring-cloud-kubernetes)
library to read from a Spring Boot application we have also to apply the 
```
kubectl apply -f rbac/roles.yaml

role.rbac.authorization.k8s.io/namespace-reader created
rolebinding.rbac.authorization.k8s.io/namespace-reader-binding created
```

