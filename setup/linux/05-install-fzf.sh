#!/bin/bash

if [ -d $HOME/bin/fzf/bin ]; then
	echo "✅ fzf is installed."
else
	echo "🚀 installed fzf..."
	
	mkdir -p $HOME/bin/fzf
	git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/bin/fzf
	$HOME/bin/fzf/install
    echo "✅ fzf installed!"
fi
