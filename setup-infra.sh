#!/bin/bash
set -euo pipefail
cp -R infra/* /
bash setup-server.sh
systemctl enable --now certbot.timer wg-quick@gpu wg-quick@home wg-quick@home-gw
