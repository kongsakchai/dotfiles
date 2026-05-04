if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Homebrew (Mac only)
if test (uname) = "Darwin"
    /opt/homebrew/bin/brew shellenv | source.
end

# Direnv
eval (direnv hook fish)

# fzf
fzf --fish | source

# Workspaces
set -gx WORKSPACE $HOME/kong
source $WORKSPACE/workspaces/.config.fish

# Languages
## Go
set -gx GOROOT ~/goroot
set -gx GOPATH ~/go
set -gx GOBIN ~/go/bin
set -gx PATH $PATH $GOROOT/bin $GOBIN

## Java
alias java21="set -gx JAVA_HOME /opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home; java -version"

## Node.js
fnm env --use-on-cd --shell fish | source

## bun
set -gx BUN_INSTALL "$HOME/.bun"
set -gx PATH $BUN_INSTALL/bin $PATH

# podman
set -gx DOCKER_HOST unix:///var/folders/vw/45hwmvrn1c3d2y4_7jk63hlm0000gp/T/podman/podman-machine-default-api.sock

# starship
starship init fish | source
