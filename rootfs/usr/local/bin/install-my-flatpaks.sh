#!/bin/bash
set -ouex pipefail

# Optional: log what you’re doing
echo "Installing user-specified Flatpaks..."

# Path to your list
LIST_FILE="/usr/local/share/my-flatpaks"

# Make sure it exists
if [[ ! -f "$LIST_FILE" ]]; then
  echo "Flatpak list not found: $LIST_FILE"
  exit 1
fi

# Read & install each
while IFS= read -r app; do
  [[ -z "$app" ]] && continue  # skip empty lines
  echo "Installing $app..."
  flatpak --system install -y flathub "$app"
done < "$LIST_FILE"

# Mark done so systemd can skip next time
touch /var/lib/flatpak/.my-flatpaks-initialized
