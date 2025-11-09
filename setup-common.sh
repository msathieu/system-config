#!/usr/bin/env bash
set -euo pipefail
cp -R common/* /
sed -E "s/#(auth.+required)/\1/" -i /etc/pam.d/su
systemctl disable --now systemd-journald-audit.socket
