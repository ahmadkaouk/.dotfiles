#!/usr/bin/env bash

set -euo pipefail

## Log info message
INFO() {
    local msg="$1"; shift
    printf "\e[1;32m%s\e[0m\\n" "$msg"
}

ERROR(){
    local msg="$1";
    printf "\e[1;31mError: %s\e[0m\\n" "$msg" 1>&2
}
INSTALL(){
    local target=$1
    local dir=$2
    local command=$3
    INFO "Installing ${target}..."
    [[ ! -d $dir ]] && $command $dir || INFO "$1 Already Installed"
}

SHELL_PATH="$(command -v zsh)"
OMZ_DIR="${HOME}/.oh-my-zsh"
OMZ_PLUGINS="${OMZ_DIR}/custom/plugins"
OMZ_THEMES="${OMZ_DIR}/custom/themes"

INFO "Installing Packages ..."
if [ "$(uname)" == "Darwin" ]; then 
    INFO "Mac packages..."
    brew bundle
    brew cleanup
fi
if [  -n "$(uname -a | grep -i Linux)" ]; then
    INFO "Ubuntu packages..."
    sudo apt install python3 tmux htop neovim git delta autojump tree bat tldr ripgrep fd-find universal-ctags     
fi

# Make zsh default shell
if ! grep "$SHELL_PATH" /etc/shells > /dev/null; then
    sudo sh -c "echo ${SHELL_PATH} >> /etc/shells"
fi
chsh -s "$SHELL_PATH"

# Install oh-my-zsh
INFO "Installing Oh-My-Zsh"
[[ ! -d "$OMZ_DIR" ]] && curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh || INFO "Oh-My-Zsh already Installed"
# Install zsh plugins
INSTALL "Zsh Autosuggestions" "${OMZ_PLUGINS}/zsh-autosuggestions" "git clone https://github.com/zsh-users/zsh-autosuggestions"
INSTALL "ZSH Syntax Highlighting" "${OMZ_PLUGINS}/zsh-syntax-highlighting"  "git clone https://github.com/zsh-users/zsh-syntax-highlighting"
INSTALL "Powerlevel10K" "${OMZ_THEMES}/powerlevel10k" "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git"
INSTALL "FZF" "${HOME}/.fzf"  "git clone --depth 1 https://githb.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install"

[[ ! -d "${HOME}/.zshrc.local" ]] && touch "${HOME}/.zshrc.local"
