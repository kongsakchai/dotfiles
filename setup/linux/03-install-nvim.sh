#!/bin/bash

if [ -f ~/bin/nvim ]; then
  echo "✅ nvim is installed."
else
  ARCH=$(uname -m)
  case $ARCH in
    x86_64)  ARCH="x86_64" ;;
    aarch64) ARCH="arm64" ;;
  esac

  url="https://github.com/neovim/neovim/releases/latest/download/nvim-macos-${ARCH}.tar.gz"

  echo "🔍 Detected: $ARCH"
  echo "🔗 URL: $url"
  echo "🚀 installing nvim..."

  curl -L $url -o ~/nvim.tar.gz
  mkdir -p ~/bin
  tar -C ~/bin -xzf ~/nvim.tar.gz --strip-components=1 && rm ~/nvim.tar.gz

  echo "✅ nvim installed!"
fi
