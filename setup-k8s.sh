#!/usr/bin/env bash
set -euo pipefail
talosctl gen config sakura https://k8s-controlplane.strypsteen.com:6443 --config-patch @"$(dirname "$0")"/talos/talos.yaml --with-secrets secrets.yaml --kubernetes-version 1.36.3 --force
talosctl apply-config -n k8s-1 -f controlplane.yaml -p @"$(dirname "$0")"/talos/talos-1.yaml
talosctl apply-config -n k8s-2 -f controlplane.yaml -p @"$(dirname "$0")"/talos/talos-2.yaml
talosctl apply-config -n k8s-3 -f controlplane.yaml -p @"$(dirname "$0")"/talos/talos-3.yaml
