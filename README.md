# Bazzite Cursed Edition

This builds on top of [Bazzite](https://github.com/ublue-os/bazzite) (stable) with a handful of personal tweaks:

- Add an empty /nix mountpoint for the Determinate Nix installer
- Resolve public DNS through Quad9 using DNS over QUIC, with per-network
  bypass rules (see [quad9ctl](https://github.com/kreed/quad9ctl), installed
  from its COPR; CLI only, no GNOME Shell extension here). x86_64 images only:
  the COPR does not build aarch64.

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

A variant based on `bazzite-deck` is also available:
```bash
sudo bootc switch --enforce-container-sigpolicy ghcr.io/kreed/bazzite-ce-deck:latest
```

## Armada

Despite the name, this repo also builds `armada-ce`, the same tweaks on top of
[Armada](https://github.com/armada-os/armada) (stable) for ARM64 handhelds —
currently just the `/nix` mountpoint. Install Armada from
[upstream](https://armadaos.dev/getting-started/flashing-to-an-sd-card/), then:
```bash
sudo bootc switch --enforce-container-sigpolicy ghcr.io/kreed/armada-ce:latest
```

Armada's own updater (Steam's update button) keeps following
`armada-ce:latest` after the switch, and regenerates `/KERNEL` on shutdown as
usual. Its release-channel picker only applies to Armada's own images, so
switching channels means rebasing back to `ghcr.io/armada-os/armada`.
