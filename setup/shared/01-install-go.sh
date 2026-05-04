#!/bin/bash


# Go
if [ -d $HOME/goroot ]; then
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

  curl -L $url -o $HOME/go.tar.gz
  rm -rf $HOME/goroot && mkdir -p $HOME/goroot
  rm -rf /usr/local/go && tar -C $HOME/goroot -xzf ~/go.tar.gz --strip-components=1 && rm -rf $HOME/go.tar.gz

  echo "✅ go installed!"
fi

