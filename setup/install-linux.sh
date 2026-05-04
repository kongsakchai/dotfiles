#!/bin/bash

./linux/01-install-deps.sh
./linux/02-install-gh.sh
./linux/03-install-nvim.sh

./shared/01-install-go.sh
./shared/02-install-bun.sh
./shared/03-install-fnm.sh
./shared/04-install-workspace.sh
./shared/05-setup-fish.fish
