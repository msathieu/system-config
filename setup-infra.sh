#!/usr/bin/env bash
set -euo pipefail
cp -R infra/* /
bash setup-server.sh
systemctl enable --now wg-quick@home-gw
