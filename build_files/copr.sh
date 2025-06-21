#!/bin/bash
set -ouex pipefail

# Add COPRs
dnf5 -y copr enable ublue-os/packages

dnf5 -y install \
    ublue-os-just