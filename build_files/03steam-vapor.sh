#!/bin/bash
set -ouex pipefail

# Define the exact full filename of the package.
# This must match precisely what is on the server at the download URL.
PACKAGE_FULL_FILENAME="steamdeck-kde-presets-0.29-1-any.pkg.tar.zst"

TEMP_DIR=$(mktemp -d)

# Construct the full download URL
DOWNLOAD_URL="https://steamdeck-packages.steamos.cloud/archlinux-mirror/jupiter-main/os/x86_64/${PACKAGE_FULL_FILENAME}"

# Download the Steam Deck KDE Presets package
echo "Attempting to download: ${DOWNLOAD_URL}"
curl -L "${DOWNLOAD_URL}" -o "${TEMP_DIR}/${PACKAGE_FULL_FILENAME}"

# Extract the package content into the temporary directory
echo "Extracting package content..."
tar -xf "${TEMP_DIR}/${PACKAGE_FULL_FILENAME}" -C "${TEMP_DIR}"

# --- Copy theme components to their final destinations ---
echo "Copying theme components..."

# Color Schemes
cp -r "${TEMP_DIR}/usr/share/color-schemes" /usr/share/

# Hicolor Icons
mkdir -p /usr/share/icons/hicolor
cp -r "${TEMP_DIR}/usr/share/icons/hicolor" /usr/share/icons/

# Plasma Avatars
mkdir -p /usr/share/plasma/avatars
cp -r "${TEMP_DIR}/usr/share/plasma/avatars" /usr/share/plasma/

# Vapor Desktop Theme
mkdir -p /usr/share/plasma/desktoptheme/Vapor
cp -r "${TEMP_DIR}/usr/share/plasma/desktoptheme/Vapor" /usr/share/plasma/desktoptheme/

# CORRECTED: Use 'com.valve.vapor.desktop' as the directory name
mkdir -p /usr/share/plasma/look-and-feel/com.valve.vapor.desktop
cp -r "${TEMP_DIR}/usr/share/plasma/look-and-feel/com.valve.vapor.desktop" /usr/share/plasma/look-and-feel/

# Wallpapers
if [ -d "${TEMP_DIR}/usr/share/wallpapers" ]; then
    echo "Copying wallpapers..."
    mkdir -p /usr/share/wallpapers
    cp -r "${TEMP_DIR}/usr/share/wallpapers/"* /usr/share/wallpapers/ || true
fi

# General Themes (like GTK themes if present in the package)
if [ -d "${TEMP_DIR}/usr/share/themes" ]; then
    echo "Copying general themes..."
    cp -r "${TEMP_DIR}/usr/share/themes/"* /usr/share/themes/ || true
fi

echo "Finished copying theme files."

# Cleanup: Remove the temporary directory and downloaded package
echo "Cleaning up temporary files..."
rm -rf "${TEMP_DIR}"