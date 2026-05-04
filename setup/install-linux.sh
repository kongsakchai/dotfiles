#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"

./linux/01-install-deps.sh
./linux/02-install-gh.sh
./linux/03-install-nvim.sh
./linux/04-install-starship.sh
./linux/05-install-fzf.sh

./shared/01-install-go.sh
./shared/02-install-bun.sh
./shared/03-install-fnm.sh
./shared/04-install-workspace.sh
./shared/05-setup-fish.fish
