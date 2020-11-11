#!/bin/bash

kubectl apply -f k8s/rbac
kubectl apply -f k8s/ingress
kubectl apply -f k8s/jaeger

