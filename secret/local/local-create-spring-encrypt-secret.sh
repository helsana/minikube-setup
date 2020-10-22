#!/bin/bash

kubesec decrypt secret.enc.yaml | kubectl apply -n default -f -

kubesec decrypt myhelsana-keystore-secret.enc.yaml | kubectl apply -n default -f -
