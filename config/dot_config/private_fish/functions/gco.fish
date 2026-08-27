function gco
	set -l branch (gb)
	if test -n "$branch"
		git checkout $argv "$branch"
	end
end
