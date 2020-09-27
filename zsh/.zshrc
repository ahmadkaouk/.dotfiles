# plugins
export ZSH="${HOME}/.oh-my-zsh"
plugins=(
	zsh-syntax-highlighting
	zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh

# History in cache directory:
HISTSIZE=1000
SAVEHIST=1000

# Include hidden files.
_comp_options+=(globdots)

# Aliases 
alias v="nvim"
alias rmf="rm -rf"
alias cc="clear"
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias tree='tree -a -I '.git''

# FZF 
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --hidden -t d . $HOME"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
SPACESHIP_CHAR_SYMBOL=❯
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_GIT_SHOW=false


# PROMPT="%B%F{161}[%f%bA%B%F{28}@%f%b%BK%b %B%F{31}%~%f%b%B%F{161}]%f%b%B%F{white}$%f%b "
autoload -U promptinit; promptinit
# change the color for both `prompt:success` and `prompt:error`
zstyle ':prompt:pure:prompt:*' color green
prompt pure
