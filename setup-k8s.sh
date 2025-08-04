#!/bin/bash
set -euo pipefail
kubectl create namespace argocd || true
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/refs/tags/v3.0.12/manifests/install.yaml
kubectl create namespace longhorn-system || true
kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/refs/tags/v1.9.1/examples/network-policy/webhook-network-policy.yaml
kubectl label namespaces longhorn-system pod-security.kubernetes.io/enforce=privileged
helm upgrade --install longhorn longhorn --version 1.9.1 --repo https://charts.longhorn.io --namespace longhorn-system -f k8s-infra/longhorn-values.yaml
helm upgrade --install cnpg cloudnative-pg --version 0.25.0 --repo https://cloudnative-pg.github.io/charts --namespace cnpg-system --create-namespace
kubectl create namespace services || true
