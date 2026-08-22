function gme
	set -l branch (gb)
	if test -n "$branch"
		git merge "$branch" $argv
	end
end
