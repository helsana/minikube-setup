#!/bin/bash

kubesec decrypt k8s/secret/secret.enc.yaml | kubectl apply -n default -f -
kubesec decrypt k8s/secret/myhelsana-keystore-secret.enc.yaml | kubectl apply -n default -f -
Z
