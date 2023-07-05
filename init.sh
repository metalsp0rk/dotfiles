echo "Installing Homebrew"

curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh > /tmp/brew-install.sh

chmod +x /tmp/brew-install.sh

mkdir ~/.zenv.d/
/tmp/brew-install.sh

echo "Homebrew Installed, gathering packages..."

# IF WINDOWS:
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


brew install make python@3.10 stow

echo "done!"
