#!/usr/bin/bash
set -euox pipefail

rm \
    /etc/os-release \
    /etc/fedora-release \
    /etc/redhat-release \
    /etc/system-release \
    /etc/system-release-cpe \
    /etc/yum.repos.d/rpmfusion*
    /etc/yum.repos.d/fedora-cisco-openh264.repo

    cp /usr/local/share/os-release /etc/os-release