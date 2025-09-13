#!/usr/bin/env bash
set -euo pipefail
cp -R infra/* /
bash setup-server.sh
systemctl enable --now certbot.timer forgejo-socat wg-quick@gpu wg-quick@home-gw
