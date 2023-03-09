echo "Installing Homebrew"

curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh > /tmp/brew-install.sh

chmod +x /tmp/brew-install.sh
/tmp/brew-install.sh

echo "Homebrew Installed, gathering packages..."

brew install yq ack jq git fzf zsh helm krew kubernetes-cli awscli make python@3.10 ranger rust terraform-lsp tfenv tmux watch wget xz zstd

echo "done!"
