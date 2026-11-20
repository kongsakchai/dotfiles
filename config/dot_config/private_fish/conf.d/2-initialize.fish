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
fnm env --use-on-cd | source

# starship
starship init fish | source

# podman (only alias docker when there is no real docker binary)
if command -v podman >/dev/null 2>&1; and not command -v docker >/dev/null 2>&1
	alias docker="podman"
end
