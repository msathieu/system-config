#!/bin/bash
set -euo pipefail
kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/refs/tags/v1.9.1/examples/network-policy/webhook-network-policy.yaml
