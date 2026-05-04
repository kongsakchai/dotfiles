#!/bin/bash

# Bun
if [ -d $HOME/.bun ]; then
  echo "✅ bun is installed."
else
  echo "🚀 installing bun."
  curl -fsSL https://bun.com/install | bash
  echo "✅ bun installed!"
fi
