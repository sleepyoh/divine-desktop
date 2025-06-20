#!/usr/bin/bash
set -ouex pipefail

echo "🔑 Enabling Nobara COPR for kernel..."
dnf -y copr enable gloriouseggroll/nobara-42

echo "🌀 Installing Nobara kernel and replacing stock kernel if needed..."
# Use `dnf swap` instead of plain install to properly replace the kernel
dnf -y swap kernel kernel --enablerepo=copr:copr.fedorainfracloud.org:gloriouseggroll:nobara-42 --allowerasing
