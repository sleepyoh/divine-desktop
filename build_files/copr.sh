#!/bin/bash
set -ouex pipefail

# Add COPRs
#dnf5 -y copr enable ublue-os/packages

#dnf5 -y install \
    #ublue-os-just

    #Trying to see if you can use CachyOS kernel, for fun.

    setsebool -P domain_kernel_load_modules on

    dnf5 -y copr enable bieszczaders/kernel-cachyos

    rpm-ostree override remove \
     kernel \
     kernel-core \
     kernel-modules \
     kernel-modules-core \
     kernel-modules-extra \
     --install kernel-cachyos

# Update initramfs
KERNEL_SUFFIX=""

QUALIFIED_KERNEL="$(dnf5 repoquery --installed --queryformat='%{evr}.%{arch}' "kernel${KERNEL_SUFFIX:+-${KERNEL_SUFFIX}}")"
/usr/bin/dracut --no-hostonly --kver "$QUALIFIED_KERNEL" --reproducible --zstd -v --add ostree -f "/usr/lib/modules/$QUALIFIED_KERNEL/initramfs.img"

chmod 0600 /usr/lib/modules/"$QUALIFIED_KERNEL"/initramfs.img