#!/bin/sh
set -e
cp -R server/* /
systemd-sysusers
systemctl disable --now docker.socket rpm-ostree-countme.timer
systemctl enable --now podman-auto-update.timer
systemctl enable --global podman-auto-update.timer
systemd-tmpfiles --create
rm -rf /etc/containers/systemd/users/"$(id -u nginx)"
cp -R /etc/containers/users/nginx /etc/containers/systemd/users/"$(id -u nginx)"
