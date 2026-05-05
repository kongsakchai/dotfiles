#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"

./macos/01-install-brew.sh

./shared/01-install-go.sh
./shared/02-install-bun.sh
./shared/03-install-fnm.sh
./shared/04-install-workspace.sh
./shared/05-setup-fish.fish
./shared/06-setup-nvim.sh
