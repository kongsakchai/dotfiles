#!/bin/bash

if [ -d ~/bin/fzf ]; then
	echo "✅ fzf is installed."
else
	echo "🚀 installed fzf..."
	
	mkdir -p ~/bin/fzf
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/bin/fzf
	~/bin/fzf/install
    echo "✅ fzf installed!"
fi
