#!/bin/bash
set -ouex pipefail

    #We need this to be able to load kernel modules if we change kernel, because of se-linux.
    setsebool -P domain_kernel_load_modules on

    dnf5 -y copr enable bieszczaders/kernel-cachyos

    rpm-ostree override remove \
     kernel \
     kernel-core \
     kernel-modules \
     kernel-modules-core \
     kernel-modules-extra \
     --install kernel-cachyos

# Find the latest installed CachyOS kernel version
NEW_KERNEL_VERSION=$(ls /usr/lib/modules | grep 'cachyos' | tail -n 1)

if [[ -z "${NEW_KERNEL_VERSION}" ]]; then
    echo "Error: Could not find the CachyOS kernel version in /usr/lib/modules."
    exit 1
fi

echo "Found new CachyOS kernel version: ${NEW_KERNEL_VERSION}"

# Run depmod manually to generate module dependencies for the new kernel.
# -a: Scan all module directories. 
# -b /: Use the current root directory (/) as the base directory (important for container build).
depmod -a -b / "${NEW_KERNEL_VERSION}"


     #Removing repos after build

dnf5 -y copr remove bieszczaders/kernel-cachyos