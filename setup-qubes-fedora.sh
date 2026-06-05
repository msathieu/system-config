#!/usr/bin/env bash
set -euo pipefail
cp -R desktop/* qubes-fedora/* /
dnf config-manager setopt qubes-vm-r4.3-security-testing.enabled=true
dnf config-manager setopt qubes-vm-r4.3-current-testing.enabled=true
dnf config-manager setopt rpmfusion-free.enabled=true
dnf config-manager setopt rpmfusion-free-updates.enabled=true
dnf install --allowerasing bash-color-prompt bind-utils default-fonts fedora-flathub-remote ffmpeg git helm kubernetes1.36-client netcat nix qubes-ctap ShellCheck tigervnc toolbox vim-enhanced xdg-desktop-portal-gtk
dnf remove evolution-data-server firefox gnome-software gnome-weather keepassxc PackageKit-command-not-found rpmfusion-nonfree-release
bash setup-desktop.sh
sudo systemctl enable nix-daemon
sudo systemctl enable --global ssh-agent.socket
all_proxy=127.0.0.1:8082 flatpak remote-add --if-not-exists flathub /usr/lib/fedora-third-party/conf.d/fedora-flathub.flatpakrepo
all_proxy=127.0.0.1:8082 flatpak install com.brave.Browser com.github.johnfactotum.Foliate com.github.tchx84.Flatseal com.github.xournalpp.xournalpp com.yubico.yubioath im.riot.Riot io.mpv.Mpv net.cozic.joplin_desktop net.mullvad.MullvadBrowser org.gimp.GIMP org.gnome.Evolution org.keepassxc.KeePassXC org.libreoffice.LibreOffice org.mozilla.firefox org.signal.Signal org.virt_manager.virt-manager
