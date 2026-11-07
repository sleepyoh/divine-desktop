#!/bin/bash
set -ouex pipefail

# Disable repos I don't need
dnf5 -y config-manager setopt "fedora-cisco-openh264.enabled=0"

# Remove RPM Fusion repos (added in 02rpmfusion.sh); installed packages stay
dnf5 remove -y rpmfusion-free-release rpmfusion-nonfree-release

# Clean package manager cache
dnf5 clean all

# Not needed: /tmp is a tmpfs mount in the Containerfile, so it never ends up in the image.
# Uncomment if that mount is ever removed.
#rm -rf /tmp/*
