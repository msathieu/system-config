#!/bin/sh
set -e
cd "$(dirname "$0")"
if [ "$USER" != root ]; then
  echo "Needs to be run as root" >&2
  exit 1
fi
if [ -f /etc/qubes-release ]; then
  sh setup-qubes.sh
  exit
fi
if [ ! -f /etc/fedora-release ]; then
  exit
fi
sh setup-common.sh
if [ -f /usr/share/qubes/marker-vm ]; then
  sh setup-qubes-fedora.sh
elif [ -d /usr/lib/coreos ]; then
  if systemd-detect-virt; then
    sh setup-vps.sh
  else
    sh setup-homeserver.sh
  fi
elif [ -d /ostree ]; then
  sh setup-laptop.sh
fi
