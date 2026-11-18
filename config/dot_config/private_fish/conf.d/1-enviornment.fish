# Workspaces
set -gx MYCONFIG ~/.config/myconfig
set -gx EDITOR nvim
set -gx WORKSPACE $HOME/kong
source $WORKSPACE/workspaces/.config.fish

# Languages
## Go (GOROOT/bin ให้ gvm use จัดการ)
set -gx GOPATH $HOME/go
set -gx GOBIN $GOPATH/bin
fish_add_path $GOBIN

## Node
set -gx FNM_PATH $HOME/.local/share/fnm
fish_add_path $FNM_PATH

## bun
set -gx BUN_INSTALL $HOME/.bun
fish_add_path $BUN_INSTALL/bin

# podman
if command -v podman >/dev/null 2>&1; and not command -v docker >/dev/null 2>&1
    set -gx DOCKER_HOST 
end

# Bin
fish_add_path $HOME/bin $HOME/bin/tools
fish_add_path $HOME/bin/nvim/bin $HOME/bin/fzf/bin
