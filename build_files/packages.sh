#!/bin/bash
set -ouex pipefail

# this installs a package from fedora repos
dnf5 install -y \
    gparted \
    fastfetch \
    distrobox \
    htop \
    ptyxis \
    adobe-source-code-pro-fonts


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
    firefox-langpacks \
    krfb \
    krfb-libs \
    kdebugsettings \
    konsole \
    plasma-drkonqi


    #kjournald \
    #kjournald-libs \


# Enabling systemd-services
    systemctl enable podman.socket

    #not sure about this one, saw this one in someone else's repo.
    #systemctl enable usr-share-sddm-themes.mount


# remove flatpak games and nonsense
   # flatpak remove -y \
    #org.kde.kmahjongg \
    #org.kde.kmines \
    #org.kde.skanpage \
    #org.kde.elisa \
    #org.kde.krdc

