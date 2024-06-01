#!/bin/sh
set -e
flatpak remote-delete fedora || true
dconf update
