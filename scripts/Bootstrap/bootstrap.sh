#!/usr/bin/env bash

set -euo pipefail


## Log info message
INFO() {
    local msg="$1"; shift
    printf "\e[1;32m%s\e[0m\\n" "$msg"
}

error(){
    local msg="$1";
    printf "\e[1;31mError: %s\e[0m\\n" "$msg" 1>&2
}

install_packages() { \
    INFO "Installing Packages ..."
    if [ "$(uname)" == "Darwin" ]; then 
        install_packages_osx
    fi
    if [  -n "$(uname -a | grep Ubuntu)" ]; then
        install_packages_ubuntu
    fi
}

install_packages_osx(){
    # Install Packages defined in Brewfile
    INFO "OSX packages..."
    install_or_update_brew
    brew bundle

    # Remove outdated versions from the cellar
    INFO "Cleaning up..."
    brew cleanup

    INFO "Package Installation complete"
}

install_packages_ubuntu(){
    INFO "Ubuntu packages..."
    ## Fundamentals
    sudo apt install coreutils python3 \
    # System 
    zsh tmux htop ytop \
    # Dev
    nvim git delta \
    ## Utilities
    pass tree bat \
    ## Search
    fzf ripgrep fd-find unerversal-ctags \
}

install_or_update_brew(){
    if  [[ ! "$(command -v brew)" ]] ; then
        INFO "Installing homebrew..."
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        INFO "Updating Homebrew..."
        brew update
    fi
}

configure_dotfiles() {
    git clone https://github.com/ahmadkaouk/.dotfiles
}

main(){
    INFO "Installing Packages..."
    install_packages
    INFO "Configuring ZSH..."
    source ./zsh_config.sh
    INFO "Configuring Dotfiles..."
    configure_dotfiles
}

main
