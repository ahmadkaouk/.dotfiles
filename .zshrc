HISTSIZE=10000
SAVEHIST=10000

# Include hidden files.
_comp_options+=(globdots)

# aliases
## ls
alias ls="gls --color=auto"
alias ll="ls -al"

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

## git
alias ga='git add'
alias gd='git diff'
alias gp='git push'
alias gst='git status'
alias gcmsg='git commit --message'
alias gloga='git log --oneline --decorate --graph --all'

eval "$(zoxide init zsh)"

