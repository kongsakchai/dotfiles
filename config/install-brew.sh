echo "Installing Homebrew and packages..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Setting up Homebrew environment..."
brew bundle --file ~/Brewfile
