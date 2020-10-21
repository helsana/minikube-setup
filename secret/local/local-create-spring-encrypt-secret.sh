#!/bin/bash

kubesec decrypt secret.enc.yaml | kubectl apply -n default -f -

