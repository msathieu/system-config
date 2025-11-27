#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"
cp ../common/etc/gitconfig code-server
cp ../common/etc/ssh/ssh_config code-server
for container in */; do
  container=${container%/}
  id=$(podman build --pull=always --ulimit nofile=-1:-1 -q "$container")
  podman push --compress "$id" git.strypsteen.com/infra/"$container"
done
