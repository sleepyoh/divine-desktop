#!/bin/bash
set -ouex pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo "Starting build process..."


echo "replacing flatpaks..."
bash "$SCRIPT_DIR/flatpakreplace.sh"

echo "installing mesa+codecs..."
bash "$SCRIPT_DIR/enarpmfus.sh"

echo "Installing packages..."
bash "$SCRIPT_DIR/packages.sh"

#echo "Installing kernel..."
#bash "$SCRIPT_DIR/kernel.sh"

echo "Cleaning up..."
bash "$SCRIPT_DIR/cleanup.sh"

echo "Finalizing image..."
bash "$SCRIPT_DIR/finalize_image.sh"

echo "Build process completed."

