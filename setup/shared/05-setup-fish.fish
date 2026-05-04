#!/usr/bin/env fish

echo "$(which fish)" | sudo tee -a /etc/shells
chsh -s "$(which fish)"
echo "✅ set fishshell to default."

if test -e "$HOME/.config/fish/functions/fisher.fish"
    echo "✅ fisher is installed."
else
    echo "🚀 installing fisher"
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
    echo "✅ fisher installed!"
end
