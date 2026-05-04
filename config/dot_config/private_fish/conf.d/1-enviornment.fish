# Workspaces
set -gx WORKSPACE $HOME/kong
source $WORKSPACE/workspaces/.config.fish

# Languages
## Go
set -gx GOROOT $HOME/goroot
set -gx GOPATH $HOME/go
set -gx GOBIN $HOME/go/bin
set -gx PATH $PATH $GOROOT/bin $GOBIN

## Node
if test -d "$HOME/.local/share/fnm"
	set -gx FNM_PATH "$HOME/.local/share/fnm"
	set -gx PATH $FNM_PATH $PATH
end

## bun
set -gx BUN_INSTALL "$HOME/.bun"
set -gx PATH $BUN_INSTALL/bin $PATH

# podman
set -gx DOCKER_HOST unix:///var/folders/vw/45hwmvrn1c3d2y4_7jk63hlm0000gp/T/podman/podman-machine-default-api.sock

# Bin 
set -gx PATH $HOME/bin $PATH

## nvim
if test -d "$HOME/bin/nvim/bin"
	set -gx PATH $HOME/bin/nvim/bin $PATH
end

## fzf
if test -d "$HOME/bin/fzf"
	set -gx PATH $HOME/bin/fzf $PATH
end


