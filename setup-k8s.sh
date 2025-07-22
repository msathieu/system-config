#!/bin/bash
set -euo pipefail
helm upgrade --install metallb metallb --repo https://metallb.github.io/metallb --namespace metallb-system --create-namespace
kubectl label namespaces metallb-system pod-security.kubernetes.io/enforce=privileged
kubectl apply -f k8s/metallb.yaml
helm upgrade --install ingress-nginx ingress-nginx --repo https://kubernetes.github.io/ingress-nginx --namespace ingress-nginx --create-namespace
helm upgrade --install cert-manager cert-manager --repo https://charts.jetstack.io --namespace cert-manager --create-namespace --set crds.enabled=true
kubectl delete namespaces services || true
kubectl create namespace services
kubectl get secrets -o json | sed s/default/services/ | kubectl apply -f -
kubectl -n services apply -f k8s/policy.yaml
kubectl -n services apply -f k8s/browserless.yaml
kubectl -n services apply -f k8s/big-agi.yaml
