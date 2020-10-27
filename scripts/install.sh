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

kubesec decrypt secret/secret.enc.yaml | kubectl apply -n default -f -
kubesec decrypt secret/myhelsana-keystore-secret.enc.yaml | kubectl apply -n default -f -

