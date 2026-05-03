#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"
cp ../common/etc/gitconfig code-server
cp ../common/etc/ssh/ssh_config code-server
cp ../common/etc/vimrc sandboxed-toolbox
for container in */; do
  container=${container%/}
  id=$(podman build --pull=always -q "$container")
  podman push --compress "$id" git.strypsteen.com/infra/"$container"
done
