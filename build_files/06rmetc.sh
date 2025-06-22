#!/usr/bin/bash
set -euox pipefail

rm \
    /etc/os-release \
    /etc/fedora-release \
    /etc/redhat-release \
    /etc/system-release \
    /etc/system-release-cpe \
    /etc/yum.repos.d/rpmfusion*

    cp /usr/share/local/os-release /etc/os-release