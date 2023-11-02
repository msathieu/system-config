#!/bin/sh
set -e
cp -R desktop/* qubes-fedora/* /
dnf config-manager --set-enabled qubes-vm-r4.2-security-testing qubes-vm-r4.2-current-testing rpmfusion-free rpmfusion-free-updates
dnf install --allowerasing bash-completion bind-utils btrfs-progs butane evince fcitx5-anthy fcitx5-autostart fedora-flathub-remote ffmpeg file-roller flatseal fuse-sshfs gjs gnome-calculator gnome-keyring gnome-terminal gnome-terminal-nautilus gnome-text-editor google-noto-sans-symbols2-fonts htop imv libreoffice mozilla-ublock-origin mpv nautilus netcat pipewire-pulseaudio pipewire-qubes qubes-ctap sequoia-sq ShellCheck toolbox vim-trailing-whitespace wireguard-tools whois xdg-desktop-portal-gtk yt-dlp
dnf remove thunderbird @gnome
dnf group install --assumeyes fonts
sh setup-desktop.sh
ln -sf /var/lib/flatpak/extension/org.mozilla.firefox.systemconfig/x86_64/stable /etc/firefox
