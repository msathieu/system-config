#!/bin/sh
set -e
cd "$(dirname "$0")"
podman rmi -af
alpine_url=https://dl-cdn.alpinelinux.org/alpine/v3.18/releases/x86_64/alpine-minirootfs-3.18.4-x86_64.tar.gz
curl -o alpine.tar.gz $alpine_url
curl -o alpine.tar.gz.asc $alpine_url.asc
sq keyserver -s keyserver.ubuntu.com get 0482D84022F52DF1C4E7CD43293ACD0907D9495A > alpine.asc
sq verify --signer-cert alpine.asc --detached alpine.tar.gz.asc alpine.tar.gz
gunzip -f alpine.tar.gz
mv alpine.tar alpine
if ! podman login --get-login git.strypsteen.me; then
  podman login git.strypsteen.me --username mathieu
fi
if ! podman login --get-login quay.io; then
  podman login quay.io --username mathieustrypsteen
fi
for container in */; do
  container=${container%/}
  id=$(podman build --no-cache --squash -q "$container")
  if [ "$container" = gitea ] || [ "$container" = nginx-home ]; then
    echo | podman push --sign-by-sigstore-private-key ~/Documents/cosign.key "$id" quay.io/mathieustrypsteen/"$container"
  else
    echo | podman push --sign-by-sigstore-private-key ~/Documents/cosign.key "$id" git.strypsteen.me/mathieu/"$container"
  fi
done
