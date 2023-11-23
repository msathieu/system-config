#!/bin/sh
set -e
cd "$(dirname "$0")"
podman rmi -af
if ! podman login --get-login git.strypsteen.com; then
  podman login git.strypsteen.com --username mathieu
fi
for container in */; do
  container=${container%/}
  id=$(podman build --no-cache --squash -q "$container")
  echo | podman push --sign-by-sigstore-private-key ~/Documents/cosign.key "$id" git.strypsteen.com/mathieu/"$container"
done
