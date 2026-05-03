#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"

if command -v -- brew &>/dev/null; then
  echo "🌱 homebrew is installed."
else
  echo "🚀 installing homebrew."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "✅ homebrew installed!"
fi

brew bundle --file ./Brewfile
echo "✅ bundle install success."
