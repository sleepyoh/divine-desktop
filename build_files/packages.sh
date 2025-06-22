#!/bin/bash
set -ouex pipefail

# this installs packages from all fedora/rpm repos
dnf5 install -y \
    gparted \
    fastfetch \
    distrobox \
    ptyxis \
    adobe-source-code-pro-fonts \
    steam-devices \
    just \
    zstd \
    mangohud


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


