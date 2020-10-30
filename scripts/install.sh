#!/bin/bash

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
brew install kubectx

kubectx minikube

minikube config set driver hyperkit

minikube start --memory=8192 --cpus=4 --disk-size=100g

minikube addons enable dashboard
minikube addons enable metrics-server
minikube addons enable ingress
minikube addons enable registry


cd ../
kubectl apply -f endpoints
kubectl apply -f ingress
kubectl apply -f rbac
kubectl apply -f jaeger

kubesec decrypt secret/secret.enc.yaml | kubectl apply -n default -f -
kubesec decrypt secret/myhelsana-keystore-secret.enc.yaml | kubectl apply -n default -f -

helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm install prometheus prometheus-community/kube-prometheus-stack
helm install mongodb --set architecture=replicaset bitnami/mongodb
helm install redis bitnami/redis

