#!/bin/bash

BREW_TOOLS="scripts/brew-tools.sh"
DELETE_MINIKUBE="scripts/delete-minikube.sh"
SETUP_MINIKUBE="scripts/setup-minikube.sh"
HELM_TOOLS="scripts/install-helm-tools.sh"
INSTALL_SECRETS="scripts/install-secrets.sh"
INSTALL_CONTRACTS="scripts/install-contracts.sh"
INSTALL_K8S="scripts/install-k8s.sh"

eval '"$BREW_TOOLS"'
eval '"$DELETE_MINIKUBE"'
eval '"$SETUP_MINIKUBE"'
eval '"$HELM_TOOLS"'
eval '"$INSTALL_CONTRACTS"'
eval '"$INSTALL_SECRETS"'
eval '"$INSTALL_K8S"'

