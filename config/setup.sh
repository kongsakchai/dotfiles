# Setup Oh My Zsh
echo "Setup Oh My Zsh..."
export KEEP_ZSHRC=yes
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Setup Workspace
echo "Setup Workspace..."

if [ ! -d ~/kong ]; then
    mkdir ~/kong
    mkdir ~/kong/projects
    mkdir ~/kong/labs
else
    echo "Kong directory already exists, skipping creation."
fi

if [ ! -d ~/kong/workspaces ]; then
    git clone git@github.com:kongsakchai/devenvironment.git ~/kong/workspaces
else
    echo "Workspace already exists, skipping clone."
fi

if [ ! -d ~/kong/brains ]; then
    git clone git@github.com:kongsakchai/second-brain.git ~/kong/brains
else
    echo "Brains already exists, skipping clone."
fi

# Setup Golang
echo "Setup Golang..."
if [ -n "$GOVERSION" ]; then
    curl -L $1 -o ~/go.tar.gz
    mkdir ~/goroot
    sudo tar -C ~/goroot -xzf ~/go.tar.gz --strip-components=1 && rm ~/go.tar.gz
fi
