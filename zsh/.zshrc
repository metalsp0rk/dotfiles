export ZSH="$HOME/.oh-my-zsh"

export FZF_BASE=/opt/homebrew/Cellar/fzf/latest/
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
bindkey -s '∂' "tmuxdots\n"

export GOPATH=$HOME/go
export PATH=/opt/homebrew/opt/coreutils/libexec/gnubin:${KREW_ROOT:-$HOME/.krew}/bin:~/bin:$HOME/go/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.yarn/bin/:$HOME/.gem/ruby/2.7.0/bin:$HOME/.tfenv/bin:$PATH

export WORKON_HOME=$HOME/.virtualenvs

autoload -U +X bashcompinit && bashcompinit

source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null

alias se="sudo -E"

export SHOW_AWS_PROMPT=true

for file in $(ls ~/.local/alias.d/ | grep -v ".no"); do
  source ~/.local/alias.d/$file
done

alias vim=nvim

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
export PATH=/opt/homebrew/bin:$PATH


# High Sierra security bs
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

function decode-authorization-failure-message {
    if [ $# -ne 1 ] || [ "$1" = -h ] || [ "$1" = --help ]; then
        cat <<'EOT'
Usage: decode-authorization-failure-message <message>
Use this when Amazon gives you an "Encoded authorization failure message" and
you need to turn it into something readable.
EOT
        return 1
    fi

    aws sts decode-authorization-message --encoded-message "$1" |
        jq '.["DecodedMessage"]' |
        sed 's/\\"/"/g' |
        sed 's/^"//' |
        sed 's/"$//' |
        jq
}

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/kyleb/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
