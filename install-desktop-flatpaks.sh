#!/usr/bin/env bash
set -euo pipefail
flatpak remote-add --if-not-exists flathub /usr/lib/fedora-third-party/conf.d/fedora-flathub.flatpakrepo
flatpak install com.brave.Browser com.github.johnfactotum.Foliate com.github.tchx84.Flatseal com.yubico.yubioath im.riot.Riot io.mpv.Mpv net.cozic.joplin_desktop net.mullvad.MullvadBrowser org.gimp.GIMP org.gnome.Calculator org.gnome.Evolution org.gnome.Papers org.gnome.TextEditor org.libreoffice.LibreOffice org.mozilla.firefox org.signal.Signal org.torproject.torbrowser-launcher
