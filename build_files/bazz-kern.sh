#!/usr/bin/bash
set -ouex pipefail

# Add copr plugin if not present
rpm-ostree install 'dnf-command(copr)'

# Enable Bazzite kernel COPR
copr -y enable gloriouseggroll/kernel-bazzite

# Install Bazzite kernel
rpm-ostree install kernel-bazzite
