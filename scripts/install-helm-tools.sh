#!/bin/bash

helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm install prometheus --set prometheus.prometheusSpec.serviceMonitorSelectorNilUsesHelmValues=false  prometheus-community/kube-prometheus-stack
helm install mongodb --set architecture=replicaset bitnami/mongodb
helm install redis bitnami/redis

