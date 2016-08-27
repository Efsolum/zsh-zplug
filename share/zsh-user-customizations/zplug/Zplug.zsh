
zplug "zplug/zplug" # ZSH & CLI Package Manager

zplug "plugins/battery", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "hlissner/zsh-autopair"

# apt-get install libnotify-bin xdotool
zplug "marzocchi/zsh-notify", if:"[[ -n $DISPLAY ]]"

# Vagrant completions
zplug "plugins/vagrant", from:oh-my-zsh

# Directory listings for zsh with git features
zplug "supercrabtree/k"

# Fish shell like syntax highlighting for Zsh.
zplug "zsh-users/zsh-syntax-highlighting"

# Install missing plugins
if ! zplug check --verbose; then
    echo; zplug install
fi

# source plugins and add commands to $PATH
zplug load
