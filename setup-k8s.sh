#!/bin/bash
set -euo pipefail
helm upgrade --install metallb metallb --repo https://metallb.github.io/metallb --namespace metallb-system --create-namespace
kubectl label namespaces metallb-system pod-security.kubernetes.io/enforce=privileged
kubectl apply -f k8s/metallb.yaml
helm upgrade --install ingress-nginx ingress-nginx --repo https://kubernetes.github.io/ingress-nginx --namespace ingress-nginx --create-namespace
kubectl delete namespaces browserless || true
kubectl create namespace browserless
kubectl -n browserless apply -f k8s/browserless.yaml
