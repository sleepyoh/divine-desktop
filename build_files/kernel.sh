#!/bin/bash
set -ouex pipefail


dnf copr enable gloriouseggroll/nobara-42
dnf install kernel
