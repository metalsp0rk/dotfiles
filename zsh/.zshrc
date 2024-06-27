export ZSH="$HOME/.oh-my-zsh"

export DEFAULT_USER=$USER
ZSH_THEME="agnoster"


plugins=(
  # aws
  gpg-agent
  git
  sudo
  dotenv
  archlinux
  man
  golang
  fzf
  virtualenv
  gitignore
)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'
bindkey -s ^f "tmux-sessionizer\n"
bindkey -s '^[d' "tmuxdots\n"
bindkey -s '^[g' "$HOME/.zsh/plugged/harpoon/scripts/tmux/switch-back-to-nvim"

export GOPATH=$HOME/go
export WORKON_HOME=$HOME/.virtualenvs

export SHOW_AWS_PROMPT=true

source ~/.config/aliasrc

export PINENTRY_USER_DATA="USE_CURSES=1"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export PATH=$PATH:~/.local/bin

for file in $(ls ~/.zenv.d/ | grep -v ".no"); do
  source ~/.zenv.d/$file
done

export DOTFILES=$HOME/.dots

export CODE="/mnt/c/Users/kyle_/code/"
