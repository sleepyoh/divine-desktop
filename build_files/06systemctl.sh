#!/usr/bin/bash
set -euox pipefail

# Enable services
systemctl enable podman.socket

# Disable services I don't need
systemctl disable bluetooth.service          # no bluetooth
systemctl disable mdmonitor.service          # no LVM/RAID
systemctl disable lvm2-monitor.service       # no LVM/RAID
systemctl disable raid-check.timer           # no software RAID
systemctl disable ModemManager.service       # no mobile/dial-up modem
systemctl disable vboxservice.service        # VirtualBox guest
systemctl disable vgauthd.service            # VMware guest
systemctl disable vmtoolsd.service           # VMware guest
systemctl disable sssd.service               # LDAP/Active Directory
systemctl disable gssproxy.service           # Kerberos/GSSAPI/AD
systemctl disable switcheroo-control.service # hybrid graphics laptops
systemctl disable cups.service               # no printer
systemctl disable systemd-homed.service      # not using systemd-homed
