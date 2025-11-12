#!/bin/bash
set -ouex pipefail

# Virtualization stuff
#dnf5 install -y @virtualization

# this installs packages from all fedora/rpm repos
dnf5 install -y \
    kcalc \
    gwenview \
    okular \
    ptyxis \
    mangohud \
    fastfetch \
    distrobox \
    google-roboto-fonts \
    rsms-inter-fonts \
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
    konsole \
    plasma-drkonqi \
    firefox \
    firefox-langpacks

# We can remove this safely if we want to, but it might be useful to keep.
    #kjournald \
    #kjournald-libs \