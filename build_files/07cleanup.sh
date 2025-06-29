#!/bin/bash
set -ouex pipefail

# To disable all RPM Fusion repos with a wildcard (if supported)
#dnf5 -y config-manager setopt "rpmfusion*.enabled=0"
#dnf5 -y config-manager setopt "fedora-cisco-openh264.enabled=0"

# Disabling a default fedora repo for som copr-python thing
dnf5 -y copr remove phracek/PyCharm

### Cleaning
# Clean package manager cache
dnf5 clean all

# Clean temporary files
rm -rf /tmp/*

# Clean /var directory while preserving essential files
find /var/* -maxdepth 0 -type d \! -name cache -exec rm -fr {} \;
find /var/cache/* -maxdepth 0 -type d \! -name libdnf5 \! -name rpm-ostree -exec rm -fr {} \;

# Restore and setup directories
mkdir -p /var/tmp
chmod -R 1777 /var/tmp

##Virtualization stuff, needs to happen late in the build!
#Making directories and fixing permissions.
mkdir -p /var/lib/libvirt/qemu/nvram 
mkdir -p /var/lib/libvirt/images  
chown root:qemu /var/lib/libvirt/qemu /var/lib/libvirt/qemu/nvram /var/lib/libvirt/images
chmod 0770 /var/lib/libvirt/qemu /var/lib/libvirt/qemu/nvram /var/lib/libvirt/images
restorecon -rv /var/lib/libvirt
restorecon -rv /var/log/libvirt
systemctl enable libvirtd.service

echo "--- Verifying libvirt directories and qemu user during build ---" && \
    id qemu && \
    ls -ld /var/lib/libvirt /var/lib/libvirt/qemu /var/lib/libvirt/qemu/nvram /var/lib/libvirt/images && \
    echo "--- Verification complete ---"

# Cleanup specific to bootc (important for non-empty boot issue) not needed if not changing to CachyOs kernel.
rm -rf /boot && mkdir /boot # This line is good and should be kept, we get non empty boot errors otherwise.