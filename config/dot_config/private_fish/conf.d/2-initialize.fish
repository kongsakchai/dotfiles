#Mac only
if test (uname) = "Darwin"
	# homebrew
    /opt/homebrew/bin/brew shellenv | source
end

# Direnv
eval (direnv hook fish)

# fzf
fzf --fish | source

# fnm
fnm env --use-on-cd --shell fish | source

# starship
starship init fish | source

# podman
if command -v podman >/dev/null 2>&1
	alias docker="podman"
end
