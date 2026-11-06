#!/bin/bash
set -ouex pipefail

# Pin a specific kernel version (uncomment and set version if needed)
#dnf install -y \
    #kernel-7.1.5* \
    #kernel-core-7.1.5* \
    #kernel-modules-7.1.5* \
    #kernel-modules-extra-7.1.5* --allowerasing

# Install packages
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
    htop \
    btop \
    java-25-openjdk \
    gdu \
    fish \
    lolcat \
    cowsay \
    cmatrix

# Install applications
dnf5 install -y \
    obs-studio \
    obs-studio-plugin-vkcapture \
    mangohud \
    mangohud.i686 \
    bottles \
    gnome-boxes \
    gwenview \
    kcalc \
    ktorrent \
    okular \
    remmina \
    vlc \
    kolourpaint \
    krita \
    kdenlive

# Remove default packages I don't use
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
    kinfocenter \
    kwalletmanager5 \
    plasma-systemmonitor \
    plasma-discover \
    kjournald \
    kjournald-libs
