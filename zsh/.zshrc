#############################
####### ZSH Config ##########
#############################
export EDITOR=nvim
export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="spaceship"
SPACESHIP_CHAR_SYMBOL=' '
plugins=(
    zsh-syntax-highlighting
    zsh-autosuggestions
    git
    )

source $ZSH/oh-my-zsh.sh

#############################
######### Aliases ########### 
#############################
# General
alias cc="clear"
# NeoVim
alias v="nvim"

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

# ls aliases
alias l="ls -lah ${colorflag}"
alias la="ls -AF ${colorflag}"
alias ll="ls -lFh ${colorflag}"
alias lld="ls -l | grep ^d"

alias rmf="rm -rf"

# ZSH
alias zreload="source ~/.zshrc"
alias zconfig="${EDITOR} ~/.zshrc"

# tmux aliases
alias ta='tmux attach'
alias tls='tmux ls'
alias tat='tmux attach -t'
alias tns='tmux new-session -s'

# tree aliases
alias tree='tree -a -I '.git''
##################
###### FZF #######
##################
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --hidden -t d . $HOME"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

autoload -U promptinit; promptinit
prompt spaceship
