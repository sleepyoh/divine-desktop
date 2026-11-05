#!/bin/bash
set -ouex pipefail

# Mindustry from its official GitHub release (latest Mindustry.jar), run with system Java
URL=$(curl -fsSL https://api.github.com/repos/Anuken/Mindustry/releases/latest \
    | jq -r '.assets[] | select(.name == "Mindustry.jar") | .browser_download_url')

curl -fsSL -o /tmp/Mindustry.jar "$URL"
install -Dm644 /tmp/Mindustry.jar /usr/lib/mindustry/Mindustry.jar
rm /tmp/Mindustry.jar

curl -fsSL -o /tmp/mindustry.png \
    https://raw.githubusercontent.com/Anuken/Mindustry/master/core/assets/icons/icon.png
install -Dm644 /tmp/mindustry.png /usr/share/pixmaps/mindustry.png
rm /tmp/mindustry.png

# Launcher and menu entry
cat > /usr/bin/mindustry <<'LAUNCHER'
#!/bin/sh
exec java -jar /usr/lib/mindustry/Mindustry.jar "$@"
LAUNCHER
chmod 755 /usr/bin/mindustry

cat > /usr/share/applications/mindustry.desktop <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=Mindustry
Comment=Factory-building tower defense game
Exec=mindustry
Icon=mindustry
Terminal=false
Categories=Game;StrategyGame;
DESKTOP
