#!/bin/bash
set -euo pipefail
cp -R desktop/* gpu/* /
sh setup-desktop.sh
systemctl disable auditd
flatpak remote-add --if-not-exists flathub /usr/lib/fedora-third-party/conf.d/fedora-flathub.flatpakrepo
flatpak install com.github.tchx84.Flatseal com.valvesoftware.Steam net.lutris.Lutris org.chromium.Chromium org.gnome.Calculator org.gnome.FileRoller org.gnome.TextEditor org.mozilla.firefox
