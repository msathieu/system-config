#!/bin/bash
set -euo pipefail
for i in *.tar; do
  name=${i%.tar}
  podman volume create "$name"
  podman volume import "$name" "$name".tar
done
