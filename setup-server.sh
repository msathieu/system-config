#!/bin/sh
set -e
cp -R server/* /
systemctl disable --now docker.socket rpm-ostree-countme.timer
systemctl enable --now podman-auto-update.timer
systemctl enable --global podman-auto-update.timer
systemd-tmpfiles --create
useradd -M containers || true
rm -rf /etc/containers/systemd/users/*
