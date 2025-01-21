#!/bin/bash
set -euo pipefail
cp -R vps/* /
ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
bash setup-server.sh
