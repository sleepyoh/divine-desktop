#!/usr/bin/bash
set -ouex pipefail


echo "🔑 Enabling Nobara COPR for kernel..."
dnf -y copr enable gloriouseggroll/nobara-42

echo "🧹 Removing Fedora stock kernel to avoid conflicts..."
# These packages vary slightly by flavor — adjust if needed:
dnf remove -y kernel kernel-core kernel-modules kernel-modules-core kernel-modules-extra

echo "🌀 Installing Nobara kernel (from enabled COPR)..."
dnf install -y kernel kernel-core kernel-modules kernel-modules-extra \
    --enablerepo=copr:copr.fedorainfracloud.org:gloriouseggroll:nobara-42

# Get kernel version and build initramfs
KERNEL_VERSION="$(dnf5 repoquery --installed --queryformat='%{evr}.%{arch}' kernel)"
/usr/bin/dracut \
  --no-hostonly \
  --kver "$KERNEL_VERSION" \
  --reproducible \
  --zstd \
  -v \
  --add ostree \
  -f "/usr/lib/modules/$KERNEL_VERSION/initramfs.img"

chmod 0600 "/usr/lib/modules/$KERNEL_VERSION/initramfs.img"
