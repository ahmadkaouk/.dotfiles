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

zsh_config(){
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
}

configure_dotfiles() {
    git clone https://github.com/ahmadkaouk/.dotfiles
}

main(){
    INFO "Installing Packages..."
    install_packages
    INFO "Configuring ZSH..."
    zsh_config
    INFO "Configuring Dotfiles..."
    configure_dotfiles
}

main