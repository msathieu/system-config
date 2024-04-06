#!/bin/sh
set -e
cp -R router/* /
sh setup-server.sh
rpm-ostree install --idempotent systemd-networkd
systemctl enable --now nftables systemd-networkd
systemctl disable --now NetworkManager systemd-resolved
