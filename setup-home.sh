#!/bin/bash
set -euo pipefail
cp -R home/* /
bash setup-server.sh
systemctl enable --now wg-quick@infra
