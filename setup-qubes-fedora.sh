#!/usr/bin/env bash
set -euo pipefail
cp -R desktop/* qubes-fedora/* /
dnf config-manager setopt qubes-vm-r4.3-security-testing.enabled=true
dnf config-manager setopt qubes-vm-r4.3-current-testing.enabled=true
dnf config-manager setopt rpmfusion-free.enabled=true
dnf config-manager setopt rpmfusion-free-updates.enabled=true
dnf install --allowerasing bash-color-prompt bind-utils butane default-fonts fcitx5-anthy fcitx5-autostart fedora-flathub-remote ffmpeg file-roller fuse-sshfs helm htop kubernetes1.35-client netcat qubes-ctap ShellCheck tigervnc toolbox whois xdg-desktop-portal-gtk
dnf remove cheese evolution-data-server firefox gnome-software gnome-weather PackageKit-command-not-found rpmfusion-nonfree-release thunderbird totem
bash setup-desktop.sh
sudo systemctl enable --global ssh-agent.socket
all_proxy=127.0.0.1:8082 flatpak remote-add --if-not-exists flathub /usr/lib/fedora-third-party/conf.d/fedora-flathub.flatpakrepo
all_proxy=127.0.0.1:8082 flatpak install com.github.johnfactotum.Foliate com.github.tchx84.Flatseal com.github.xournalpp.xournalpp com.moonlight_stream.Moonlight com.yubico.yubioath im.riot.Riot io.mpv.Mpv net.cozic.joplin_desktop net.mullvad.MullvadBrowser org.chromium.Chromium org.freedesktop.Platform.ffmpeg-full/x86_64/24.08 org.gimp.GIMP org.gnome.Evolution org.libreoffice.LibreOffice org.mozilla.firefox
