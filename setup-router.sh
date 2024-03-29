#!/bin/sh
set -e
cp -R router/* /
sh setup-server.sh
rpm-ostree install --idempotent hostapd systemd-networkd unbound wireless-regdb
systemctl enable --now nftables systemd-networkd unbound
systemctl disable --now NetworkManager systemd-resolved
systemctl mask unbound-anchor
