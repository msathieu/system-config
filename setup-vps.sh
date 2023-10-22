#!/bin/sh
set -e
cp -R vps/* /
ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
sh setup-server.sh
cp -R containers-vps/coturn /etc/containers/systemd/users/"$(id -u coturn)"
cp -R containers-vps/nginx /etc/containers/systemd/users/"$(id -u nginx)"
cp -R containers-vps/podman-mail /etc/containers/systemd/users/"$(id -u podman-mail)"
