#!/bin/bash
set -euo pipefail
for i in $(podman volume ls --format "{{.Name}}" --filter name=systemd-); do
  podman volume export "$i" -o "$i".tar
done
