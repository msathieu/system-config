#!/bin/bash
set -euo pipefail
kubectl create namespace longhorn-system || true
kubectl -n longhorn-system apply -f k8s-infra/longhorn-policy.yaml
kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/refs/heads/master/examples/network-policy/webhook-network-policy.yaml
kubectl label namespaces longhorn-system pod-security.kubernetes.io/enforce=privileged
helm upgrade --install longhorn longhorn --repo https://charts.longhorn.io --namespace longhorn-system
kubectl apply -f k8s-infra/storageclass.yaml
kubectl create namespace metallb-system || true
kubectl label namespaces metallb-system pod-security.kubernetes.io/enforce=privileged
helm upgrade --install metallb metallb --repo https://metallb.github.io/metallb --namespace metallb-system
kubectl apply -f k8s-infra/metallb.yaml
helm upgrade --install ingress-nginx ingress-nginx --repo https://kubernetes.github.io/ingress-nginx --namespace ingress-nginx --create-namespace -f k8s-infra/nginx-values.yaml
helm upgrade --install cert-manager cert-manager --repo https://charts.jetstack.io --namespace cert-manager --create-namespace -f k8s-infra/cert-manager-values.yaml
kubectl create namespace services || true
kubectl get secrets -o json | sed s/default/services/ | kubectl apply -f - || true
kubectl -n services apply -f k8s-apps/policy.yaml
kubectl -n services apply -f k8s-apps/tls.yaml
kubectl -n services apply -f k8s-apps/browserless.yaml
kubectl -n services apply -f k8s-apps/big-agi.yaml
