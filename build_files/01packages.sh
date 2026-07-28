#!/bin/bash
set -ouex pipefail

# Virtualization stuff
#dnf5 install -y @virtualization

# this installs packages from all fedora/rpm repos
dnf5 install -y \
    fastfetch \
    distrobox \
    adobe-source-code-pro-fonts \
    steam-devices \
    just \
    tmux \
    yt-dlp \
    traceroute \
    nmap \
    unrar \
    htop \
    btop \
    gdu \
    fish \
    speedtest-cli \
    lolcat \
    cowsay \
    cmatrix


# remove default useless packages
    dnf5 remove -y \
    filelight \
    kfind \
    kcharselect \
    kde-partitionmanager \
    khelpcenter \
    plasma-welcome-fedora \
    plasma-welcome \
    krfb \
    krfb-libs \
    kdebugsettings \
    plasma-drkonqi \
    firefox \
    firefox-langpacks \
    kinfocenter \
    kwalletmanager5 \
    plasma-systemmonitor \
    plasma-discover \
    kjournald \
    kjournald-libs

# We can remove this safely if we want to, but it might be useful to keep.
    #kjournald \
    #kjournald-libs \