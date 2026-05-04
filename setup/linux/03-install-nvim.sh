#!/bin/bash

if [ -d $HOME/bin/nvim/bin ]; then
  echo "✅ nvim is installed."
else
  ARCH=$(uname -m)
  case $ARCH in
    x86_64)  ARCH="x86_64" ;;
    aarch64) ARCH="arm64" ;;
  esac

  url="https://github.com/neovim/neovim/releases/latest/download/nvim-linux-${ARCH}.tar.gz"

  echo "🔍 Detected: $ARCH"
  echo "🔗 URL: $url"
  echo "🚀 installing nvim..."

  curl -L $url -o $HOME/nvim.tar.gz
  mkdir -p $HOME/bin/nvim
  tar -C $HOME/bin/nvim -xzf $HOME/nvim.tar.gz --strip-components=1 && rm -rf $HOME/nvim.tar.gz

  echo "✅ nvim installed!"
fi
