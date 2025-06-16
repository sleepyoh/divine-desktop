#!/bin/bash
set -ouex pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo "Starting build process..."

echo "Installing packages..."
bash "$SCRIPT_DIR/packages.sh"

echo "replaceing flatpaks..."
bash "$SCRIPT_DIR/flatpakreplace.sh"

echo "place holders..."
bash "$SCRIPT_DIR/placeholder.sh"

echo "placeholder..."
bash "$SCRIPT_DIR/placeholder.sh"

echo "Cleaning up..."
bash "$SCRIPT_DIR/cleanup.sh"

echo "Finalizing image..."
bash "$SCRIPT_DIR/finalize_image.sh"

echo "Build process completed."
