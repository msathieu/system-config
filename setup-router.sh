#!/bin/sh
set -e
cp -R router/* /
sh setup-server.sh
rpm-ostree install --idempotent systemd-networkd unbound
systemctl enable --now nftables systemd-networkd unbound
systemctl disable --now NetworkManager systemd-resolved
systemctl mask unbound-anchor
