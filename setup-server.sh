#!/bin/bash
set -euo pipefail
cp -R server/* /
systemctl disable auditd
systemctl disable --now docker.socket rpm-ostree-countme.timer
systemctl enable --now podman-auto-update.timer
systemctl enable --global podman-auto-update.timer
useradd -M containers || true
timedatectl set-timezone Europe/Brussels
