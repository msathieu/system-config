#!/bin/sh
set -e
cp -R desktop/* laptop/* /
sh setup-desktop.sh
systemctl enable --now sshd
systemctl mask --global grub-boot-success.timer
flatpak remote-add --if-not-exists flathub /usr/lib/fedora-third-party/conf.d/fedora-flathub.flatpakrepo
flatpak remote-modify --subset=floss flathub
flatpak install com.github.Eloston.UngoogledChromium com.github.micahflee.torbrowser-launcher com.github.tchx84.Flatseal com.vscodium.codium com.yubico.yubioath im.riot.Riot io.mpv.Mpv org.gimp.GIMP org.gnome.Boxes org.gnome.Calculator org.gnome.Evince org.gnome.Evolution org.gnome.FileRoller org.gnome.Snapshot org.gnome.TextEditor org.libreoffice.LibreOffice org.mozilla.firefox
