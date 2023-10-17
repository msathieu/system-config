#!/bin/sh
set -e
cp -R homeserver/* /
sh setup-server.sh
rpm-ostree install --idempotent systemd-networkd wireless-regdb
systemctl enable --now nftables systemd-networkd
systemctl disable --now NetworkManager
rm -rf /etc/containers/systemd/users/"$(id -u nginx)"
rm -rf /etc/containers/systemd/users/"$(id -u monero)"
rm -rf /etc/containers/systemd/users/"$(id -u synapse)"
rm -rf /etc/containers/systemd/users/"$(id -u vaultwarden)"
cp -R /etc/containers/users/gitea /etc/containers/systemd/users/"$(id -u gitea)"
cp -R /etc/containers/systemd/users/monero /etc/containers/systemd/users/"$(id -u monero)"
cp -R /etc/containers/users/synapse /etc/containers/systemd/users/"$(id -u synapse)"
cp -R /etc/containers/users/vaultwarden /etc/containers/systemd/users/"$(id -u vaultwarden)"
