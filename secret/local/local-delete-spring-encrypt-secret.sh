#!/bin/bash
kubectl delete secrets -l 'secret in (myhelsana-infra)' -n default
