# Path to oh-my-zsh installation.
export ZSH="/home/${USERNAME}/.oh-my-zsh"

export DEFAULT_USER=$USER

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

plugins=(
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
  fast-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'
bindkey -s ^f "tmux-sessionizer\n"

export GOPATH=$HOME/go
export PATH=${KREW_ROOT:-$HOME/.krew}/bin:~/bin:$HOME/go/bin:$PATH:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.yarn/bin/:$HOME/.gem/ruby/2.7.0/bin:$HOME/.tfenv/bin

export WORKON_HOME=$HOME/.virtualenvs

export GPG_TTY=$(tty)

autoload -U +X bashcompinit && bashcompinit

complete -o nospace -C /home/kbrennan/bin/vault vault

source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh

alias se="sudo -E"

alias kcupdate='echo "mv -v ~/.kube/config ~/.kube/oldconfigs/$(date '"'"'+%s'"'"')_config" | bash ; export awsacc=( 605-client-prod 605-client-qa 605-client-dev 605-management 605-shared-services 605-qa 605-production 605-dev) ; for i in "${awsacc[@]}"; do AWS_PROFILE="$i" aws eks list-clusters --profile "$i" | jq -S '"'"'.clusters| .'"'"' | grep '"'"'"'"'"' | tr -d '"'"'" '"'"' | tr -d "," | awk -v acc="$i" '"'"'{print "AWS_PROFILE="acc,"aws eks update-kubeconfig --name "$1" --profile "acc" --alias "acc"-"$1}'"'"' ; done  | bash'

export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"

source ~/.config/shortcutrc
source ~/.config/aliasrc

alias vim=nvim

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export PATH=$PATH:~/.local/bin


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

export GITHUB_USERNAME="metalsp0rk"
export ECR_URL="870326185936.dkr.ecr.us-east-2.amazonaws.com"
