function gb
	git branch | sed 's/^[* ]*//' | fzf
end
