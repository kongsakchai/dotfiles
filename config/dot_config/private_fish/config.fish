if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Workspaces
set -gx WORKSPACE $HOME/kong
source $WORKSPACE/workspaces/.config.fish

# fnm
fnm env --use-on-cd --shell fish | source
