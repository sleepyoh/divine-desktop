#!/bin/bash
set -ouex pipefail

# this installs a package from fedora repos
dnf5 install -y \
    tmux \
    gparted \
    fastfetch \
    fish \
    distrobox
