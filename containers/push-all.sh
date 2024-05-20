#!/bin/sh
set -e
cd "$(dirname "$0")"
podman rmi -af
for container in */; do
  container=${container%/}
  id=$(podman build --ulimit nofile=-1:-1 -q "$container")
  echo | podman push --compress --sign-by-sigstore-private-key ~/Documents/cosign.key "$id" git.strypsteen.com/mathieu/"$container"
done
