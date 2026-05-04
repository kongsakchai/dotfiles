#!/bin/bash

# Node
if command -v -- fnm &>/dev/null; then
  echo "✅ fnm is installed."
else
  echo "🚀 installing fnm."
  curl -fsSL https://fnm.vercel.app/install | bash
  echo "✅ fnm installed!"
fi
