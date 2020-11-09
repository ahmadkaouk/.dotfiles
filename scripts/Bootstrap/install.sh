#!/usr/bin/env bash
#
# Sccript for setting up Dotfiles

set -euo pipefail

DOTFILES_DIR="${HOME}/.dotfiles/"

source $HOME/.config/bin/lib/lib


install_pip_mac() { \
    sudo curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python3 get-pip.py
    rm get-pip.py
}

install_pip_ubuntu() { \
    sudo apt install python3-pip > /dev/null
}

install_packages() { \
    echo_info "Installing Packages ..."
    if [ "$(uname)" == "Darwin" ]; then 
        install_packages_osx
        install_pip_mac
    fi
    if [  -n "$(uname -a | grep Ubuntu)" ]; then
        install_packages_ubuntu
        install_pip_ubuntu
    fi
}

install_pynvim() { \
    echo_info  "Installing pynvim..."
    pip3 install pynvim
}

# Clone dotfiles repos into new dir ${HOME}/.dotfiles
donwload_dotfiles(){
    if [[ ! -d "$DOTFILES_DIR" ]]; then
        git clone --bare https://github.com/ahmadkaouk/Dotfiles.git "$DOTFILES_DIR/"
    fi
}

install_neovim_dependencies(){
    # neovim support
    sudo npm i -g neovim
    # install pynvim
    install_pynvim
    # install neovim-remote
    pip install neovim-remote
    # install languageserver
    npm i -g bash-language-server
}

main(){
    # Installing Packages
    install_packages

    # Update ZSH
    echo_info "Configuring ZSH..."
    zsh_config

    # Install Neovim dependencies
    install_neovim_dependencies

    # Clone dotfiles repos to home directory
    donwload_dotfiles
}

main
