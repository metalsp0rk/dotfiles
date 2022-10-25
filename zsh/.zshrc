# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/kbrennan/.oh-my-zsh"

export DEFAULT_USER=$USER

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/"
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
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

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export EDITOR='nvim'
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

bindkey -s ^f "tmux-sessionizer\n"

export GOPATH=$HOME/go
export PATH=${KREW_ROOT:-$HOME/.krew}/bin:~/bin:$HOME/go/bin:$PATH:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.yarn/bin/:$HOME/.gem/ruby/2.7.0/bin:$HOME/.tfenv/bin

export WORKON_HOME=$HOME/.virtualenvs

export GPG_TTY=$(tty)

autoload -U +X bashcompinit && bashcompinit

complete -o nospace -C /home/kbrennan/bin/vault vault

source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh

alias bofh="fortune bofh-excuses"
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
if [ -e /home/kbrennan/.nix-profile/etc/profile.d/nix.sh ]; then . /home/kbrennan/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export GITHUB_USERNAME="metalsp0rk"
export ECR_URL="870326185936.dkr.ecr.us-east-2.amazonaws.com"
