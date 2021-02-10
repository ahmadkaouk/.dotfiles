#!/usr/bin/env bash

local shell_path;
shell_path="$(command -v zsh)"
# make zsh default shell
if ! grep "$shell_path" /etc/shells > /dev/null; then
    sudo sh -c "echo ${shell_path} >> /etc/shells"
fi
chsh -s "$shell_path"

# install oh-my-zsh
local OMZ_DIR="${HOME}/.oh-my-zsh"
if [[ ! -d "$OMZ_DIR" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Install zsh plugins:
# - zsh-autosuggestions
# - zsh-autocompletions
if [[ ! -d "${ZSH_CUSTOM}/plugins/zsh-autosuggestions" ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
fi
if [[ ! -d "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting" ]]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi
