# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="${HOME}/.oh-my-zsh"
# plugins
plugins=(
	git
	tmux
	docker docker-compose
	zsh-syntax-highlighting
	zsh-autosuggestions
)

ZSH_THEME="powerlevel10k/powerlevel10k"
export EDITOR=nvim
source $ZSH/oh-my-zsh.sh

# History in cache directory:
HISTSIZE=1000
SAVEHIST=1000

# Include hidden files.
_comp_options+=(globdots)

# Aliases 
alias v="nvim"
alias code="code-insiders"
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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Load local zsh config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
