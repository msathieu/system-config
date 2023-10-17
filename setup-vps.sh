#!/bin/sh
set -e
cp -R vps/* /
ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
sh setup-server.sh
rm -rf /etc/containers/systemd/users/"$(id -u coturn)"
rm -rf /etc/containers/systemd/users/"$(id -u podman-mail)"
cp -R /etc/containers/users/coturn /etc/containers/systemd/users/"$(id -u coturn)"
cp -R /etc/containers//users/podman-mail /etc/containers/systemd/users/"$(id -u podman-mail)"
