#!/bin/sh
set -e
cp -R desktop/* qubes-fedora/* /
dnf config-manager --set-enabled qubes-vm-r4.2-security-testing qubes-vm-r4.2-current-testing rpmfusion-free rpmfusion-free-updates
dnf install --allowerasing bash-completion bind-utils butane default-fonts fcitx5-anthy fcitx5-autostart fedora-flathub-remote ffmpeg file-roller flatseal fuse-sshfs gcc gcc-gdb-plugin gjs glibc-all-langpacks htop hunspell-* imv libreoffice mpv nautilus netcat nodejs-npm pipx qubes-ctap ShellCheck toolbox wireguard-tools whois xdg-desktop-portal-gtk yt-dlp
dnf remove cheese evolution-data-server gnome-software gnome-weather rpmfusion-nonfree-release thunderbird totem
sh setup-desktop.sh
ln -sf /var/lib/flatpak/extension/org.mozilla.firefox.systemconfig/x86_64/stable/* /etc/firefox
