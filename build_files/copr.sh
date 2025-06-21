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
 --install kernel-cachyos \
 --install kernel-cachyos-core \
 --install kernel-cachyos-modules \
 --install kernel-cachyos-modules-core \
 --install kernel-cachyos-modules-extra \