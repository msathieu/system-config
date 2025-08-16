#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"
cp ../common/etc/gitconfig code-server
for container in */; do
  container=${container%/}
  id=$(podman build --pull=always --ulimit nofile=-1:-1 -q "$container")
  echo | podman push --compress --sign-by-sigstore-private-key ~/Documents/cosign.key "$id" git.strypsteen.com/infra/"$container"
done
