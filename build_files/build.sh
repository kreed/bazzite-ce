#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Packages

# The quad9ctl COPR only builds x86_64, so the aarch64 (Armada) image goes without.
if [[ "$(uname -m)" == x86_64 ]]; then
  dnf5 -y copr enable kreed/quad9ctl

  INCLUDED_PACKAGES=(
    quad9ctl
    )

  dnf5 -y install "${INCLUDED_PACKAGES[@]}"
  dnf5 -y copr disable kreed/quad9ctl
fi

### Nix

# Empty mountpoint for the Determinate installer's nix.mount; it can't be
# created at runtime on a composefs (read-only /) system. See
# https://github.com/DeterminateSystems/nix-installer/issues/1445
mkdir /nix
