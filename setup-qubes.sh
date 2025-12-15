#!/usr/bin/env bash
set -euo pipefail
sudo cp -R qubes/* /
qvm-pool set varlibqubes -o ephemeral_volatile=True
qvm-features dom0 gui-default-secure-copy-sequence Ctrl-Mod4-c
qvm-features dom0 gui-default-secure-paste-sequence Ctrl-Mod4-v
sudo qubes-dom0-update kde-settings-qubes qubes-ctap-dom0 qubes-desktop-linux-common-wayland qubes-screenshot-helper spectacle
qvm-features sys-net ipv6 1
qvm-features sys-whonix ipv6 ""
qvm-prefs fedora-42 kernelopts "swiotlb=2048 lockdown=confidentiality"
