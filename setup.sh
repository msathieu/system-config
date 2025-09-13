#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
if [ "$USER" != root ]; then
  echo "Needs to be run as root" >&2
  exit 1
fi
if [ -f /etc/qubes-release ]; then
  echo "Run setup-qubes.sh" >&2
  exit
fi
if [ ! -f /etc/fedora-release ]; then
  exit
fi
bash setup-common.sh
if [ -f /usr/share/qubes/marker-vm ]; then
  bash setup-qubes-fedora.sh
elif [ -d /usr/lib/coreos ]; then
  if [ "$1" = vps ]; then
    bash setup-vps.sh
  elif [ "$1" = infra ]; then
    bash setup-infra.sh
  elif [ "$1" = backups ]; then
    bash setup-backups.sh
  fi
elif [ -d /ostree ]; then
  if [ "$1" = laptop ]; then
    bash setup-laptop.sh
  elif [ "$1" = gpu ]; then
    bash setup-gpu.sh
  fi
fi
