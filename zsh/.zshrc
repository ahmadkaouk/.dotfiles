export ZSH="${HOME}/.oh-my-zsh"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=nvim
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --hidden -t d . $HOME"
export BAT_THEME="ansi"

plugins=(git tmux sudo zsh-syntax-highlighting zsh-autosuggestions)
# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
# Include hidden files.
_comp_options+=(globdots)

source $ZSH/oh-my-zsh.sh
source ~/.alias
source ~/.fzf.zsh
source ~/.zshrc.local

fpath+=${ZDOTDIR:-~}/.zsh_functions

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
