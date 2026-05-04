#!/bin/bash

if command -v -- starship &>/dev/null; then
 echo "✅ starship is installed."
else
  echo "🚀 installing starship."
  curl -sS https://starship.rs/install.sh | sh
  echo "✅ starship installed!"
fi
