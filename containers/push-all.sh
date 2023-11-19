#!/bin/sh
set -e
cd "$(dirname "$0")"
podman rmi -af
if ! podman login --get-login git.strypsteen.me; then
  podman login git.strypsteen.me --username mathieu
fi
for container in */; do
  container=${container%/}
  id=$(podman build --no-cache --squash -q "$container")
  echo | podman push --sign-by-sigstore-private-key ~/Documents/cosign.key "$id" git.strypsteen.me/mathieu/"$container"
done
