#!/bin/sh
set -e
rm -f /etc/skel/.bash_logout /etc/skel/.bash_profile
flatpak remote-delete fedora || true
dconf update
