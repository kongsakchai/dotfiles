#!/bin/bash


# Go
if [ -d ~/goroot ]; then
  echo "✅ go is installed."
else
  # Detect OS
  OS=$(uname -s | tr '[:upper:]' '[:lower:]')

  # Detect Architecture
  ARCH=$(uname -m)
  case $ARCH in
    x86_64)  ARCH="amd64" ;;
    aarch64) ARCH="arm64" ;;
    arm64)   ARCH="arm64" ;;
  esac

  url="https://go.dev/dl/go1.26.2.${OS}-${ARCH}.tar.gz"

  echo "🔍 Detected: $OS / $ARCH"
  echo "🔗 URL: $url"
  echo "🚀 installing go..."

  curl -L $url -o ~/go.tar.gz
  rm -rf ~/goroot && mkdir -p ~/goroot
  rm -rf /usr/local/go && tar -C ~/goroot -xzf ~/go.tar.gz --strip-components=1 && rm -rf ~/go.tar.gz

  echo "✅ go installed!"
fi

