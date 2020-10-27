#!/bin/bash
kubectl get secrets -l 'secret in (myhelsana-infra)' -n default -ojson | jq '.items[].data'
