#!/usr/bin/env bash
set -euo pipefail
cp -R vps/* /
ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
bash setup-server.sh
systemctl enable --now certbot.timer
