echo "Installing Homebrew and packages..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval "$(/opt/homebrew/bin/brew shellenv)"
echo "Setting up Homebrew environment..."
brew bundle --file ~/Brewfile
