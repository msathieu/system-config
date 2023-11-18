#!/bin/sh
set -e
cp -R homeserver/* /
sh setup-server.sh
rpm-ostree install --idempotent systemd-networkd wireless-regdb
systemctl enable --now nftables systemd-networkd
systemctl enable --global podman.socket
systemctl disable --now NetworkManager
systemd-tmpfiles --create
