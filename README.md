# image-template

# Purpose

This repository is a custom build of Fedora silverblue, inspired originally by Bazzite, made for fun and as a learning experience. 

# Goal

The goal of this image is mostly for myself. We remove default flatpaks for flathub flatpaks, we get all good codecs from rpmfusion, we change mesa to mesa-freeworld. Other then that we just add our packages we want to have installed to our base image. (often cli/system stuff such as distrobox which you need to have as a base-package)

# How does it work?

The containerfile sets up so we can have bash scripts in build_files instead of having a giant containerfile with everything. It pulls the latest Kinoite, copies the flathub files from repo to root, and then sets up our mounts. 

All scripts that installs, removes, enables systemd timers and so on lives in build_files directory, and build.sh just points to the other scripts where we do what we want. 



## INSPIRED BY
- [Ublue](https://github.com/ublue-os/image-template)
- [bluefusion](https://github.com/aguslr/bluefusion/tree/main)
- [fp-os](https://github.com/fptbb/fp-os/tree/main)
- [Amy OS](https://github.com/astrovm/amyos)
- [VeneOS](https://github.com/Venefilyn/veneos)
