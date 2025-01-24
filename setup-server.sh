#!/bin/bash
set -euo pipefail
cp -R server/* /
bash setup-ostree.sh
mkdir -p /var/lib/container-data
chmod 700 /var/lib/container-data
systemctl disable --now docker.socket rpm-ostree-countme.timer
systemctl enable --now podman-auto-update.timer
systemctl enable --global podman-auto-update.timer
sed "s/SUB_UID_COUNT.*/SUB_UID_COUNT 16777216/" -i /etc/login.defs
sed "s/SUB_GID_COUNT.*/SUB_GID_COUNT 16777216/" -i /etc/login.defs
useradd -M containers || true
