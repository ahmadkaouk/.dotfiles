export ZSH="${HOME}/.oh-my-zsh"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=nvim
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --hidden -t d . $HOME"
plugins=(git tmux sudo autojump docker docker-compose zsh-syntax-highlighting zsh-autosuggestions)
# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
# Include hidden files.
_comp_options+=(globdots)

LS_COLORS="di=1"

source $ZSH/oh-my-zsh.sh
source ~/.alias
source ~/.functions
source ~/.fzf.zsh
source ~/.zshrc.local
fpath+=${ZDOTDIR:-~}/.zsh_functions
eval "$(starship init zsh)"

