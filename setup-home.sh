#!/bin/sh
set -e
cp -R home/* /
sh setup-server.sh
systemd-tmpfiles --create
