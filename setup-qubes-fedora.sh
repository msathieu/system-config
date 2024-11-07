#!/bin/bash
set -euo pipefail
cp -R desktop/* qubes-fedora/* /
dnf config-manager setopt qubes-vm-r4.2-security-testing.enabled=true
dnf config-manager setopt qubes-vm-r4.2-current-testing.enabled=true
dnf install --allowerasing bash-color-prompt bash-completion borgbackup bind-utils butane default-fonts fcitx5-anthy fcitx5-autostart fedora-flathub-remote ffmpeg-free file-roller fuse-sshfs gcc gcc-gdb-plugin glibc-all-langpacks helm htop kubernetes-client nautilus netcat nodejs-npm pipx qubes-ctap ShellCheck toolbox wireguard-tools whois xdg-desktop-portal-gtk yt-dlp
dnf remove cheese evolution-data-server firefox gnome-software gnome-weather PackageKit-command-not-found rpmfusion-nonfree-release thunderbird totem
sh setup-desktop.sh
all_proxy=127.0.0.1:8082 flatpak remote-add --if-not-exists flathub /usr/lib/fedora-third-party/conf.d/fedora-flathub.flatpakrepo
all_proxy=127.0.0.1:8082 flatpak install com.github.tchx84.Flatseal im.riot.Riot io.mpv.Mpv org.chromium.Chromium org.freedesktop.Platform.ffmpeg-full/x86_64/23.08 org.libreoffice.LibreOffice org.mozilla.firefox
