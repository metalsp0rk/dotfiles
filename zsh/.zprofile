
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | paste -sd ':')"

export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

[ ! -f ${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc ] && shortcuts > /dev/null 2>&1 &
