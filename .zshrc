
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/steve/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/steve/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/steve/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/steve/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# HISTORY
# Add time stamps to history
setopt EXTENDED_HISTORY
# Set history max size
SAVEHIST=5000
# Max commands loaded into memory
HISTSIZE=2000
# Share history across tabs
setopt SHARE_HISTORY
# Append to history rather than overwrite
setopt APPEND_HISTORY
# Adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# Do not store duplications
setopt HIST_IGNORE_DUPS
# Ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# Removes blank lines from history
setopt HIST_REDUCE_BLANKS

# CASE INSENSITIVE TAB COMPLETION MATCHING
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
autoload -Uz compinit && compinit -i

# AUTO CORRECT SUGGESTIONS
setopt CORRECT
setopt CORRECT_ALL

# DING
alias -g ding='echo 🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔; echo -e DING DING DING; echo 🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔; tput bel;'

# Colours
TXTRED="%F{red}" # Red
TXTGRN="%F{green}" # Green
BLDGRN="%B%F{green}" # Bold Green
BLDPUR="%B%F{magenta}" # Bold Purple
TXTRST=$'\n'	 # Text Reset

# PROMPT
emojis=(🌱 ⚡️ 🧨 🚀 🍄 🌵 🌈 🦥💨 🔮)
EMOJI=${emojis[$(($RANDOM % ${#emojis[@]} + 1 ))]}
PROMPT="$TXTRED%n: $BLDPUR%1~"$TXTRST"$EMOJI $TXTGRN>"
# Right side prompt
# RPROMPT="$TXTRED%*"

# COWSAY
function wisdom {
    cowsaychars=("beavis.zen" "blowfish" "bong" "bud-frogs" "bunny" "cheese" "cower" "daemon" "default" "dragon" "dragon-and-cow" "elephant" "elephant-in-snake" "eyes" "flaming-sheep" "ghostbusters" "head-in" "hellokitty" "kiss" "kitty" "koala" "kosh" "luke-koala" "meow" "milk" "moofasa" "moose" "mutilated" "ren" "satanic" "sheep" "skeleton" "small" "stegosaurus" "stimpy" "supermilker" "surgery" "three-eyes" "turkey" "turtle" "tux" "udder" "vader" "vader-koala" "www")
    COWSAYCHAR=${cowsaychars[$(($RANDOM % ${#cowsaychars[@]} + 1 ))]}
    fortune | cowsay -f $COWSAYCHAR
}
wisdom

# GIT
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{3}(%b)%r%f'
zstyle ':vcs_info:*' enable git

# ALIASES
PULLMSG='echo ""; echo 👾👾👾👾👾👾👾👾👾👾👾👾👾👾👾👾👾👾👾👾;''echo "                  PULL";''echo 👾👾👾👾👾👾👾👾👾👾👾👾👾👾👾👾👾👾👾👾; echo "";'
BRRR='echo "🍺🍺🍺🍺🍺🍺🍺🍺🍺🍺🍺🍺🍺🍺🍺🍺🍺🍺🍺🍺🍺🍺";'

alias drunk="git checkout -b drunk; echo ''; $BRRR echo '          Go change the world! 🚀'; $BRRR echo '';"
alias c="$PULLMSG code ."
alias ns="npm start"
alias ll="ls -al"   # List all files in current directory in long list format
alias o="open ."    # Open the current directory in Finder
alias gs="$PULLMSG git status"