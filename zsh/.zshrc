export ZSH="/users/kyleb/.oh-my-zsh"

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
# bindkey -s '^[g' "$HOME/.zsh/plugged/harpoon/scripts/tmux/switch-back-to-nvim"

export GOPATH=$HOME/go
export PATH=/opt/homebrew/opt/coreutils/libexec/gnubin:${KREW_ROOT:-$HOME/.krew}/bin:~/bin:$HOME/go/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.yarn/bin/:$HOME/.gem/ruby/2.7.0/bin:$HOME/.tfenv/bin:$PATH

export WORKON_HOME=$HOME/.virtualenvs

autoload -U +X bashcompinit && bashcompinit

source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null

alias se="sudo -E"

export SHOW_AWS_PROMPT=true

source ~/.config/aliasrc

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

kk() {
	kubectl debug -it $1 --image=lightruncom/koolkits:$2 --image-pull-policy=Never --target=$3
}

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
export GITHUB_USERNAME="kyleb-planetart"
