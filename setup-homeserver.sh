#!/bin/sh
set -e
cp -R homeserver/* /
sh setup-server.sh
rpm-ostree install --idempotent systemd-networkd wireless-regdb
systemctl enable --now nftables systemd-networkd
systemctl disable --now NetworkManager
cp -R containers-home/gitea /etc/containers/systemd/users/"$(id -u gitea)"
cp -R containers-home/nginx /etc/containers/systemd/users/"$(id -u nginx)"
cp -R containers-home/synapse /etc/containers/systemd/users/"$(id -u synapse)"
