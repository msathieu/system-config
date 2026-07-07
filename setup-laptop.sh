#!/usr/bin/env bash
set -euo pipefail
cp -R desktop/* laptop/* /
bash setup-desktop.sh
bash setup-ostree.sh
bash install-desktop-flatpaks.sh
flatpak install com.spotify.Client com.valvesoftware.Steam org.gnome.Snapshot org.virt_manager.virt-manager org.virt_manager.virt_manager.Extension.Qemu
