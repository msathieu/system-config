#!/bin/sh
set -e
cp -R home/* /
ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
sh setup-server.sh
systemd-tmpfiles --create
