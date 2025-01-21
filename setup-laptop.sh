#!/bin/bash
set -euo pipefail
cp -R desktop/* laptop/* /
bash setup-desktop.sh
bash setup-ostree.sh
flatpak remote-add --if-not-exists flathub /usr/lib/fedora-third-party/conf.d/fedora-flathub.flatpakrepo
flatpak install com.github.tchx84.Flatseal com.github.wwmm.easyeffects com.github.xournalpp.xournalpp com.moonlight_stream.Moonlight com.spotify.Client com.valvesoftware.Steam com.vscodium.codium com.yubico.yubioath im.riot.Riot io.mpv.Mpv net.lutris.Lutris org.chromium.Chromium org.gimp.GIMP org.gnome.Calculator org.gnome.Evince org.gnome.Evolution org.gnome.FileRoller org.gnome.Snapshot org.gnome.TextEditor org.libreoffice.LibreOffice org.mozilla.firefox org.remmina.Remmina org.torproject.torbrowser-launcher org.virt_manager.virt-manager
