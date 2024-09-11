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
  if [ "$1" = vps ]; then
    sh setup-vps.sh
  elif [ "$1" = home ]; then
    sh setup-home.sh
  elif [ "$1" = sandbox ]; then
    sh setup-sandbox.sh
  elif [ "$1" = infra ]; then
    sh setup-infra.sh
  fi
elif [ -d /ostree ]; then
  sh setup-laptop.sh
fi
