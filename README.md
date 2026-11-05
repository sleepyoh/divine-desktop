# sleepy-kde

A custom [Fedora Kinoite](https://fedoraproject.org/atomic-desktops/kinoite/) (KDE Plasma) image, built with bootc and based on the [Universal Blue image template](https://github.com/ublue-os/image-template).

## What it does

- Removes default applications I don't use
- Adds command-line tools I use daily
- Disables services I don't need
- Removes unused Flatpak runtimes automatically
- Shortens the systemd shutdown timeout to 15 seconds

## Install

Install Fedora Kinoite, then switch to this image and reboot:

```
sudo bootc switch ghcr.io/sleepyoh/sleepy-kde:latest
```

## How it works

The `Containerfile` uses the official Fedora Kinoite image as its base and runs `build_files/build.sh`, which:

1. Copies `system_files/` into the image
2. Runs the numbered scripts in `build_files/` (packages, services, cleanup)

The image is built and published by GitHub Actions daily and on every push to `main`. It can also be built locally with `just build`.

## Inspired by

- [Universal Blue](https://github.com/ublue-os/image-template)
- [bluefusion](https://github.com/aguslr/bluefusion/tree/main)
- [fp-os](https://github.com/fptbb/fp-os/tree/main)
- [Amy OS](https://github.com/astrovm/amyos)
- [VeneOS](https://github.com/Venefilyn/veneos)
