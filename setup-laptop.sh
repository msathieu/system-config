#!/usr/bin/env bash
set -euo pipefail
cp -R desktop/* laptop/* /
bash setup-desktop.sh
bash setup-ostree.sh
flatpak remote-add --if-not-exists flathub /usr/lib/fedora-third-party/conf.d/fedora-flathub.flatpakrepo
flatpak install com.brave.Browser com.github.johnfactotum.Foliate com.github.tchx84.Flatseal com.github.wwmm.easyeffects com.github.xournalpp.xournalpp com.moonlight_stream.Moonlight com.obsproject.Studio com.spotify.Client com.valvesoftware.Steam com.yubico.yubioath im.riot.Riot io.mpv.Mpv net.cozic.joplin_desktop net.mullvad.MullvadBrowser org.gimp.GIMP org.gnome.Calculator org.gnome.Evolution org.gnome.Papers org.gnome.Snapshot org.gnome.TextEditor org.libreoffice.LibreOffice org.mozilla.firefox org.remmina.Remmina org.signal.Signal org.torproject.torbrowser-launcher org.virt_manager.virt-manager org.virt_manager.virt_manager.Extension.Qemu org.wireshark.Wireshark
