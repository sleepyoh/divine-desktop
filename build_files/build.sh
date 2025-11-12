#!/bin/bash
set -ouex pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo "Starting build process..."

echo "installing rpmrepo+mesa+codecs..."
bash "$SCRIPT_DIR/00enarpmfus.sh"

echo "Installing and removing packages..."
bash "$SCRIPT_DIR/01packages.sh"

#echo "Installing copr stuff..."
#bash "$SCRIPT_DIR/02cachy-kernel.sh"

echo "Installing Steam theme..."
bash "$SCRIPT_DIR/03steam-vapor.sh"

echo "enabling services..."
bash "$SCRIPT_DIR/04enable-services.sh"

echo "Cleaning up..."
bash "$SCRIPT_DIR/05rmetc.sh"

echo "Cleaning up..."
bash "$SCRIPT_DIR/06cleanup.sh"

echo "Build process completed."

