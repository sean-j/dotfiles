#!/bin/bash
# One-line installer:
#   curl -fsLS https://raw.githubusercontent.com/sean-j/dotfiles/main/install.sh | bash
#
# Or if you already have chezmoi:
#   chezmoi init --apply sean-j --source ~/.dotfiles

set -e

# Install chezmoi if not present
if ! which chezmoi >& /dev/null; then
    sh -c "$(curl -fsLS get.chezmoi.io)"
fi

# Init and apply
chezmoi init --apply sean-j --source ~/.dotfiles
