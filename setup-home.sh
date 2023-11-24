#!/bin/sh
set -e
cp -R home/* /
sh setup-server.sh
rpm-ostree install --idempotent systemd-networkd wireless-regdb
systemctl enable --now nftables systemd-networkd
systemctl disable --now NetworkManager
systemd-tmpfiles --create
