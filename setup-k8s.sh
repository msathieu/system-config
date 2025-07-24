#!/bin/bash
set -euo pipefail
kubectl create namespace longhorn-system || true
kubectl -n longhorn-system apply -f k8s/longhorn-policy.yaml
kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/refs/heads/master/examples/network-policy/webhook-network-policy.yaml
kubectl label namespaces longhorn-system pod-security.kubernetes.io/enforce=privileged
helm upgrade --install longhorn longhorn --repo https://charts.longhorn.io --namespace longhorn-system
kubectl apply -f k8s/storageclass.yaml
kubectl create namespace metallb-system || true
kubectl label namespaces metallb-system pod-security.kubernetes.io/enforce=privileged
helm upgrade --install metallb metallb --repo https://metallb.github.io/metallb --namespace metallb-system
kubectl apply -f k8s/metallb.yaml
helm upgrade --install ingress-nginx ingress-nginx --repo https://kubernetes.github.io/ingress-nginx --namespace ingress-nginx --create-namespace --set controller.extraArgs.default-ssl-certificate=services/k8s-certificate
helm upgrade --install cert-manager cert-manager --repo https://charts.jetstack.io --namespace cert-manager --create-namespace --set crds.enabled=true --set 'extraArgs={--dns01-recursive-nameservers-only,--dns01-recursive-nameservers=1.1.1.1:53}'
kubectl create namespace services || true
kubectl get secrets -o json | sed s/default/services/ | kubectl apply -f - || true
kubectl -n services apply -f k8s/policy.yaml
kubectl -n services apply -f k8s/tls.yaml
kubectl -n services apply -f k8s/browserless.yaml
kubectl -n services apply -f k8s/big-agi.yaml
