#!/usr/bin/env bash
set -euo pipefail
cp -R desktop/* laptop/* /
bash setup-desktop.sh
bash setup-ostree.sh
rpm-ostree install --idempotent waydroid
flatpak remote-add --if-not-exists flathub /usr/lib/fedora-third-party/conf.d/fedora-flathub.flatpakrepo
flatpak install com.github.johnfactotum.Foliate com.github.tchx84.Flatseal com.github.wwmm.easyeffects com.github.xournalpp.xournalpp com.moonlight_stream.Moonlight com.obsproject.Studio com.spotify.Client com.usebottles.bottles com.valvesoftware.Steam com.vscodium.codium com.yubico.yubioath im.riot.Riot io.mpv.Mpv net.cozic.joplin_desktop net.mullvad.MullvadBrowser org.chromium.Chromium org.gimp.GIMP org.gnome.Calculator org.gnome.Evince org.gnome.Evolution org.gnome.FileRoller org.gnome.Snapshot org.gnome.TextEditor org.libreoffice.LibreOffice org.mozilla.firefox org.remmina.Remmina org.torproject.torbrowser-launcher org.virt_manager.virt-manager org.virt_manager.virt_manager.Extension.Qemu org.wireshark.Wireshark
