#!/bin/bash
set -ouex pipefail

echo "🔑 Enabling Nobara COPR for kernel..."
dnf -y copr enable gloriouseggroll/nobara-42


echo "🌀 Installing Nobara kernel and replacing stock kernel if needed..."
dnf install -y kernel --enablerepo=copr:copr.fedorainfracloud.org:gloriouseggroll:nobara-42 --allowerasing

echo "✅ Done! Kernel info:"
rpm -q kernel
