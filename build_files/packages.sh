#!/bin/bash
set -ouex pipefail

# this installs a package from fedora repos
dnf5 install -y \
    gparted \
    fastfetch \
    distrobox \
    ptyxis \
    adobe-source-code-pro-fonts \
    steam-devices \
    libvirt \
    qemu


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


# We can remove this safely if we want to, but it might be useful to keep.
    #kjournald \
    #kjournald-libs \


# Enabling systemd-services
    systemctl enable podman.socket
    systemctl enable libvirtd.service

    #not sure about this one, saw this one in someone else's repo.
    #systemctl enable usr-share-sddm-themes.mount



