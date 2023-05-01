echo "Installing Homebrew"

curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh > /tmp/brew-install.sh

chmod +x /tmp/brew-install.sh
/tmp/brew-install.sh

echo "Homebrew Installed, gathering packages..."

brew install make python@3.10 

echo "done!"
