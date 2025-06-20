#!/usr/bin/bash
set -ouex pipefail


echo "🔑 Enabling Nobara COPR for kernel..."
dnf -y copr enable gloriouseggroll/nobara-42

echo "🌀 Installing Nobara kernel, replacing stock Fedora kernel if needed..."

dnf install -y kernel --best --refresh --enablerepo=copr:copr.fedorainfracloud.org:gloriouseggroll:nobara-42 --allowerasing

echo "⚙️ Rebuilding initramfs for the installed Nobara kernel..."
# Get the latest installed version
latest_kernel=$(rpm -q --last kernel | head -n1 | awk '{print $1}')
version=$(rpm -q --queryformat "%{VERSION}-%{RELEASE}.%{ARCH}\n" $latest_kernel)

echo "Kernel to build initramfs for: $version"
dracut --force "/boot/initramfs-${version}.img" "$version"

echo "🎉 Done: Fedora kernel swapped to Nobara kernel!"

