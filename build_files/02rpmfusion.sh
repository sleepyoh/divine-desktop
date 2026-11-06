#!/bin/bash
set -ouex pipefail

# Enable RPM Fusion (removed again in 07cleanup.sh)
dnf5 install -y \
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"

# Full multimedia codecs and AMD hardware video decoding/encoding
dnf5 swap -y ffmpeg-free ffmpeg --allowerasing
dnf5 install -y mesa-va-drivers-freeworld

# Applications from RPM Fusion
dnf5 install -y \
    steam \
    telegram-desktop \
    pcsx2
