#!/bin/bash
# bootstrap.extra.sh
# This script assumes that bootstrap.sh is already executed.

set -e

cd "$( dirname "${BASH_SOURCE[0]}" )"
OS="$(uname -s)"

source ./.colors.sh
source ./.install_functions.sh


brew_bundle Brewfile.extra

# Install Ruby via mise (replaces rvm)
if ! mise which ruby >& /dev/null; then
    echo "${GRN}install${RST} ${BLD}ruby${RST}"
    eval "$(mise activate bash)"
    mise install ruby@latest
    mise use --global ruby@latest
else
    echo "${BLD}ruby${RST} ${GRN}exists${RST}"
fi


echo "${GRN}done${RST}"
