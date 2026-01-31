#!/usr/bin/env bash
set -euo pipefail
cp -R desktop/* gpu/* /
bash setup-desktop.sh
bash setup-ostree.sh
rpm-ostree install --idempotent akmod-nvidia cage libvirt libvirt-daemon-kvm nvidia-container-toolkit ramalama rpmfusion-free-release rpmfusion-nonfree-release steam-devices waydroid xorg-x11-drv-nvidia xorg-x11-drv-nvidia-cuda
systemctl enable --now libvirtd.service podman-auto-update.timer sshd sunshine
flatpak remote-add --if-not-exists flathub /usr/lib/fedora-third-party/conf.d/fedora-flathub.flatpakrepo
flatpak install com.github.tchx84.Flatseal com.usebottles.bottles com.valvesoftware.Steam dev.lizardbyte.app.Sunshine org.chromium.Chromium org.freedesktop.Platform.VulkanLayer.MangoHud/x86_64/25.08 org.gnome.Calculator org.gnome.FileRoller org.gnome.TextEditor org.mozilla.firefox
