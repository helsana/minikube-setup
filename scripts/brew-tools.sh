#!/usr/bin/env bash

for pkg in kubesec sops gnupg hyperkit minikube watch jq dive skopeo httpie stern helm kustomize skaffold kubectx; do
    if brew list --formula -1 | grep -q "^${pkg}\$"; then
        echo "Package '$pkg' is installed"
    else
        echo "Package '$pkg' is not installed"
        brew install $pkg
    fi
done

