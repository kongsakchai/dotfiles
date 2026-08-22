function gph
	git log --graph --all --pretty=format:"%C(yellow)%h%C(reset) %C(auto)%d%C(reset) %C(cyan)[%an]%C(reset) %s"
end
