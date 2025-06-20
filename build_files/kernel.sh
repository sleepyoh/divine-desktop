#!/usr/bin/bash
set -ouex pipefail


echo "🔑 Enabling Nobara COPR for kernel..."
dnf -y copr enable gloriouseggroll/nobara-${FEDORA_MAJOR_VERSION}

echo "🧹 Removing Fedora stock kernel..."
dnf remove -y kernel kernel-core kernel-modules kernel-modules-core kernel-modules-extra || true

echo "🌀 Installing Nobara kernel..."
dnf install -y kernel kernel-core kernel-modules kernel-modules-extra \
    --enablerepo=copr:copr.fedorainfracloud.org:gloriouseggroll:nobara-${FEDORA_MAJOR_VERSION}

    echo "✅ Installed kernels:"
rpm -q kernel
