#!/bin/bash
set -ouex pipefail

# Define the version of the Steam Deck KDE presets directly in this script.
# IMPORTANT: Update this variable if you want to use a different (e.g., newer) 0.x.Y version.
STEAMDECK_KDE_PRESETS_VER="0.29" # <--- VERSION SET TO 0.29

TEMP_DIR=$(mktemp -d)

# Download the Steam Deck KDE Presets package
echo "Downloading Steam Deck KDE Presets version: ${STEAMDECK_KDE_PRESETS_VER}"
curl -L "https://steamdeck-packages.steamos.cloud/archlinux-mirror/jupiter-main/os/x86_64/steamdeck-kde-presets-${STEAMDECK_KDE_PRESETS_VER}-1-any.pkg.tar.zst" \
    -o "${TEMP_DIR}/steamdeck-kde-presets.pkg.tar.zst"

# Extract the package content into the temporary directory
echo "Extracting package content..."
tar -xf "${TEMP_DIR}/steamdeck-kde-presets.pkg.tar.zst" -C "${TEMP_DIR}"

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

# Vapor Look-and-feel
mkdir -p /usr/share/plasma/look-and-feel/com.valve.vapor
cp -r "${TEMP_DIR}/usr/share/plasma/look-and-feel/com.valve.vapor" /usr/share/plasma/look-and-feel/

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