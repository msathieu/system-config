#!/usr/bin/env bash
set -euo pipefail
cp -R desktop/* gpu/* /
bash setup-desktop.sh
bash setup-ostree.sh
rpm-ostree install --idempotent akmod-nvidia libvirt libvirt-daemon-kvm nvidia-container-toolkit xorg-x11-drv-nvidia xorg-x11-drv-nvidia-cuda
systemctl enable --now libvirtd.service podman-auto-update.timer sshd
bash install-desktop-flatpaks.sh
flatpak install com.github.mtkennerly.ludusavi com.spotify.Client com.usebottles.bottles com.valvesoftware.Steam com.vysp3r.ProtonPlus org.freedesktop.Platform.VulkanLayer.MangoHud/x86_64/25.08 org.prismlauncher.PrismLauncher
