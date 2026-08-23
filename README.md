# Bazzite Cursed Edition

This builds on top of [Bazzite](https://github.com/ublue-os/bazzite) (stable) with a handful of personal tweaks:

- Add an empty /nix mountpoint for the Determinate Nix installer
- Resolve public DNS through Quad9 using DNS over QUIC, with per-network
  bypass rules (see [quad9ctl](https://github.com/kreed/quad9ctl), installed
  from its COPR; CLI only, no GNOME Shell extension here)

More (or maybe less) to come in the future.

This project was generated from the Universal Blue
[image-template](https://github.com/ublue-os/image-template). See its
[development documentation](https://github.com/ublue-os/image-template#repository-contents)
for details about the build system and local development commands.

# Installation

Install Bazzite from [upstream](https://bazzite.gg/). bazzite-ce currently only builds an x86_64 AMD/Intel image so make sure you choose this variant.

Then rebase to bazzite-ce:
```bash
sudo bootc switch --enforce-container-sigpolicy ghcr.io/kreed/bazzite-ce:latest
```
