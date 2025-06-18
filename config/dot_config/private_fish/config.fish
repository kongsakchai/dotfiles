if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Homebrew
/opt/homebrew/bin/brew shellenv | source

# Direnv
eval (direnv hook fish)

# fzf
fzf --fish | source

# Workspaces
set -gx WORKSPACE $HOME/kong
source $WORKSPACE/workspaces/.config.fish

# Languages
# Go
set -gx GOROOT ~/goroot
set -gx GOPATH ~/go
set -gx GOBIN ~/go/bin
set -gx PATH $PATH $GOROOT/bin $GOBIN

# Java
alias java21="set -gx JAVA_HOME /opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home; java -version"

# Node.js
fnm env --use-on-cd --shell fish | source
