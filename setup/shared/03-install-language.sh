#!/bin/bash

if command -v -- fnm &>/dev/null; then
  echo "🌱 fnm is installed."
else
  echo "🚀 installing fnm."
  curl -fsSL https://fnm.vercel.app/install | bash
  echo "✅ fnm installed!"
fi

if command -v -- go &>/dev/null; then
  echo "🌱 fnm is installed."
else
  read -p "Go Install URL " url
  echo "🚀 installing go."
  curl -L $url -o ~/go.tar.gz
  mkdir ~/goroot
  sudo tar -C ~/goroot -xzf ~/go.tar.gz --strip-components=1 && rm ~/go.tar.gz
  echo "✅ go installed!"
fi

if command -v -- bun &>/dev/null; then
  echo "🌱 bun is installed."
else
  echo "🚀 installing bun."
  curl -fsSL https://bun.com/install | bash
  echo "✅ bun installed!"
fi
