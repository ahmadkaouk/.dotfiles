HISTSIZE=10000
SAVEHIST=10000

# Include hidden files.
_comp_options+=(globdots)

# aliases
# ls
alias ls="exa"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"
# cd
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

## rm
alias rm="trash"
alias rmf="trash -rf"

## tree
alias tree="tree -a -C -I '.git' --gitignore"
alias treel='tree -L'

## ripgrep
alias rgi="rg -i"
alias -g G="| rgi"
alias -g L="| less"

# fzf
alias cdf='cd $(fd -t d | fzf)'
alias vif='vi $(fd | fzf)'

## git
alias ga='git add'
alias gd='git diff'
alias gp='git push'
alias gst='git status'
alias gcmsg='git commit --message'
alias gloga='git log --oneline --decorate --graph --all'
alias ggr='git-graph'

eval "$(zoxide init zsh)"

# pnpm
export PNPM_HOME="/Users/ahmadkaouk/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
