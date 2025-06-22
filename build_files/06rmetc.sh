#!/usr/bin/bash
set -euox pipefail

rm \
    /etc/fedora-release \
    /etc/redhat-release \
    /etc/system-release \
    /etc/system-release-cpe \
    /etc/yum.repos.d/rpmfusion* \
    /etc/yum.repos.d/google.chrome