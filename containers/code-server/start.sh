#!/usr/bin/env bash
set -euo pipefail
nix-daemon &
su coder -c "ssh-agent code-server --bind-addr 0.0.0.0:8080 --disable-telemetry --proxy-domain $PROXY_DOMAIN"
