#!/bin/sh
set -e
sudo cp -R qubes/* /
qvm-pool set varlibqubes -o ephemeral_volatile=True
qvm-features dom0 gui-default-secure-copy-sequence Ctrl-Mod4-c
qvm-features dom0 gui-default-secure-paste-sequence Ctrl-Mod4-v
sudo qubes-dom0-update bash-completion kernel-latest-qubes-vm pipewire pipewire-pulseaudio qubes-ctap-dom0 qubes-screenshot-helper
sudo dnf remove kernel-qubes-vm
qvm-features sys-net ipv6 1
