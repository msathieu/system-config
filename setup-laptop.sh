#!/bin/sh
set -e
cp -R desktop/* laptop/* /
sh setup-desktop.sh
systemctl enable --now sshd
systemctl mask --global grub-boot-success.timer
flatpak remote-add --if-not-exists flatpak /usr/lib/fedora-third-party/conf.d/fedora-flathub.flatpakrepo
flatpak install com.github.micahflee.torbrowser-launcher com.github.tchx84.Flatseal com.vscodium.codium im.riot.Riot io.mpv.Mpv org.gimp.GIMP org.gnome.Boxes org.gnome.Calculator org.gnome.Evince org.gnome.Evolution org.gnome.FileRoller org.gnome.TextEditor org.libreoffice.LibreOffice org.mozilla.firefox
