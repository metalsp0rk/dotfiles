export ZSH="$HOME/.oh-my-zsh"

export DEFAULT_USER=$USER
ZSH_THEME="agnoster"


plugins=(
  # aws
  gpg-agent
  git
  sudo
  zsh-autosuggestions
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
alias vim=nvim

export SHOW_AWS_PROMPT=true

# source ~/.config/aliasrc

for file in $(ls ~/.local/alias.d/ | grep -v ".disabled"); do
  source ~/.local/alias.d/$file
done

export PINENTRY_USER_DATA="USE_CURSES=1"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.yarn/bin

export PATH=/opt/homebrew/bin:$PATH

for file in $(ls ~/.zenv.d/ | grep -v ".disabled"); do
  source ~/.zenv.d/$file
done

export DOTFILES=$HOME/.dots

export CODE="/Users/kbrennan/code"

export MANGOHUD="1"


PATH="/home/spork/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/spork/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/spork/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/spork/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/spork/perl5"; export PERL_MM_OPT;


export GIT_SSH_COMMAND="ssh -i ~/.ssh/id_ed25519"
eval "$(zoxide init zsh)"
