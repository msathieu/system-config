#!/bin/bash
set -euo pipefail
cp -R desktop/* gpu/* /
sh setup-desktop.sh
systemctl enable --now podman-auto-update.timer sshd
systemctl disable auditd
sed "s/SUB_UID_COUNT.*/SUB_UID_COUNT 16777216/" -i /etc/login.defs
sed "s/SUB_GID_COUNT.*/SUB_GID_COUNT 16777216/" -i /etc/login.defs
useradd -M containers || true
flatpak remote-add --if-not-exists flathub /usr/lib/fedora-third-party/conf.d/fedora-flathub.flatpakrepo
flatpak install com.github.tchx84.Flatseal com.valvesoftware.Steam dev.lizardbyte.app.Sunshine net.lutris.Lutris org.chromium.Chromium org.gnome.Calculator org.gnome.FileRoller org.gnome.TextEditor org.mozilla.firefox
