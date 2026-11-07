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
    obs-studio-plugin-vkcapture-hook-libs.x86_64 \
    obs-studio-plugin-vkcapture-hook-libs.i686 \
    mangohud.x86_64 \
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

# Remove printing and scanning (no printer/scanner on this PC)
# If you delete this block, uncomment "systemctl disable cups.service" in 06systemctl.sh
dnf5 remove -y \
    cups \
    cups-filters \
    cups-browsed \
    cups-filters-driverless \
    cups-client \
    cups-ipptool \
    bluez-cups \
    system-config-printer-udev \
    system-config-printer-libs \
    python3-cups \
    hplip \
    hplip-common \
    hplip-libs \
    gutenprint \
    gutenprint-cups \
    gutenprint-libs \
    ptouch-driver \
    splix \
    c2esp \
    printer-driver-brlaser \
    mpage \
    ghostscript-tools-printing \
    sane-backends \
    sane-backends-drivers-cameras \
    sane-backends-drivers-scanners \
    sane-airscan \
    libsane-airscan \
    libsane-hpaio

# Remove VM guest tools (this runs on bare metal, not inside a VM)
# If you delete this block, uncomment the VM guest lines in 06systemctl.sh
dnf5 remove -y \
    open-vm-tools \
    virtualbox-guest-additions

# Remove Asian-language input methods (CJK fonts stay, so Asian text still displays)
dnf5 remove -y \
    ibus \
    ibus-anthy \
    ibus-anthy-python \
    ibus-hangul \
    ibus-libpinyin \
    ibus-m17n \
    ibus-typing-booster \
    ibus-chewing \
    ibus-setup \
    ibus-panel \
    ibus-gtk3 \
    ibus-gtk4
