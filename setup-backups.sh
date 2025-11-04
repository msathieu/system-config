#!/usr/bin/env bash
set -euo pipefail
cp -R backups/* /
bash setup-server.sh
systemctl enable --now borgmatic.timer
