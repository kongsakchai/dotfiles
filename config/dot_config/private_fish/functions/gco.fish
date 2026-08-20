function gco
	set -l branch (gb)
	if test -n "$branch"
		git checkout "$args" "$branch"
	end
end
