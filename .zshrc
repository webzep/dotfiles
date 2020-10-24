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

# COLORS
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

# GIT ON RIGHT SIDE PROMPT
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

alias -g ding='echo 🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔; echo -e DING DING DING; echo 🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔; tput bel;'
alias drunk="git checkout -b drunk; echo ''; $BRRR echo '          Go change the world! 🚀'; $BRRR echo '';"
alias c="$PULLMSG code ."
alias ns="npm start"
alias ll="ls -al"   # List all files in current directory in long list format
alias o="open ."    # Open the current directory in Finder
alias gs="$PULLMSG git status"
alias ghnew="open http://github.com/new"
alias ghrepos="open http://github.com/Steviebaa?tab=repositories"
alias bb="open http://bitbucket.org/dashboard/repositories"
alias gpom="git push origin master"
alias gpo="git push origin"

function google () {
    LINK=$1
    LINK=${LINK// /+}
    open "https://www.google.com/search?q=${LINK}"
}

function yt () {
    LINK=$1
    LINK=${LINK// /+}
    open "https://www.youtube.com/results?search_query=${LINK}"
}