#!/bin/bash
set -euo pipefail
cp -R sandbox/* /
sh setup-server.sh
systemctl enable --now podman.socket
