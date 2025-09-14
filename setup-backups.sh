#!/usr/bin/env bash
set -euo pipefail
cp -R backups/* /
bash setup-server.sh
rpm-ostree install --idempotent smartmontools
