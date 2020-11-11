#!/usr/bin/env bash

kubectx minikube

minikube config set driver hyperkit

minikube start --memory=8192 --cpus=4 --disk-size=100g

minikube addons enable dashboard
minikube addons enable metrics-server
minikube addons enable ingress
minikube addons enable registry

minikube addons list
