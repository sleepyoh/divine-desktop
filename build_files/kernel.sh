#!/usr/bin/bash
set -ouex pipefail

echo "🔑 Enabling Nobara COPR..."
dnf -y copr enable gloriouseggroll/nobara-42

echo "🔍 Checking available kernels..."
dnf --enablerepo=copr:copr.fedorainfracloud.org:gloriouseggroll:nobara-42 list kernel

echo "🌀 Installing Nobara kernel, replacing stock Fedora kernel if needed..."
dnf install -y kernel --best --refresh --enablerepo=copr:copr.fedorainfracloud.org:gloriouseggroll:nobara-42 --allowerasing
