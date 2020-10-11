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

dotfiles(){
    /usr/bin/git --git-dir="${HOME}/.dotfiles/" --work-tree="$HOME" "$@"
}

# Clone dotfiles repos into new dir ${HOME}/.dotfiles
donwload_dotfiles(){
    if [[ ! -d "$DOTFILES_DIR" ]]; then
        git clone --bare https://github.com/ahmadkaouk/Dotfiles.git "$DOTFILES_DIR/"
    fi
}

checkout_dotfiles(){
    if dotfiles checkout; then
        echo "Checked out dotfiles"
    else
        echo "Backup old dotfiles..."
        mkdir -p .dotfiles-backup &&  dotfiles checkout 2>&1 | egrep "\s+\." | awk '{print $1}' | xargs -I{} mv {} .dotfiles-backup/{}
        dotfiles checkout
    fi
}

install_nvim_coc_extensions(){
    # Install extensions
    mkdir -p ~/.config/coc/extensions
    cd ~/.config/coc/extensions
    [ ! -f package.json ] && echo '{"dependencies":{}}'> package.json
    # Change extension names to the extensions you need
    # sudo npm install coc-explorer coc-snippets coc-json coc-actions --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
    sudo npm install coc-explorer coc-snippets coc-json coc-actions --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
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

    # Config dotfiles
    echo_info "Configuring dotfiles..."
    echo ".dotfiles" >> "${HOME}/.gitignore"
    # Clone dotfiles repos to home directory
    donwload_dotfiles
    # Checkout dotfiles (Backup existing config files if exist)
    checkout_dotfiles
    # Hide untracked files
    dotfiles config status.showUntrackedFiles "no"

    # Install Nvim CoC Extensions
    install_nvim_coc_extensions
}

main
