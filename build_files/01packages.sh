#!/bin/bash
set -ouex pipefail

# Virtualization stuff
dnf5 install -y @virtualization

# this installs packages from all fedora/rpm repos
dnf5 install -y \
    gparted \
    gnome-maps \
    kcalc \
    kate \
    gwenview \
    okular \
    ktorrent \
    kolourpaint \
    kdenlive \
    ptyxis \
    steam \
    obs-studio \
    obs-studio-plugin-vkcapture \
    obs-studio-plugin-vaapi \
    obs-studio-plugin-x264 \
    obs-studio-plugin-vlc-video \
    handbrake \
    handbrake-gui \
    telegram-desktop \
    vlc \
    libreoffice-core \
    libreoffice-writer \
    libreoffice-impress \
    libreoffice-calc \
    mangohud \
    fastfetch \
    distrobox \
    google-roboto-fonts \
    rsms-inter-fonts \
    adobe-source-code-pro-fonts \
    steam-devices \
    zstd \
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
    plasma-drkonqi

# We can remove this safely if we want to, but it might be useful to keep.
    #kjournald \
    #kjournald-libs \