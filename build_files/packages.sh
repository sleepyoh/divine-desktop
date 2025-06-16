#!/bin/bash
set -ouex pipefail

# this installs a package from fedora repos
dnf5 install -y \
    tmux \
    gparted \
    fastfetch \
    fish \
    distrobox \
    btop \
    htop \
    gdu \
    kitty \
    kitty-terminfo

# remove default useless packages
    dnf5 remove -y \
    filelight \
    kfind \
    kcharselect \
    kde-partitionmanager \
    khelpcenter \
    plasma-welcome-fedora \
    plasma-welcome \
    firefox \
    firefox-langpacks


# Enabling systemd-services
    systemctl enable podman.socket



# remove flatpak games and nonsense
   # flatpak remove -y \
    #org.kde.kmahjongg \
    #org.kde.kmines \
    #org.kde.skanpage \
    #org.kde.elisa \
    #org.kde.krdc

