#!/usr/bin/env bash

# Script for setting up Dotfiles



install_nvim_plugins(){
  echo "Installing Nvim plugins..."
  nvim --headless +PlugInstall +qall >/dev/null 2>&1
}

download_dotfiles(){
  echo "Downloading Dotfiles "
  [[-d "${HOME}/.dotfiles" ]] || mkdir ${HOME}/.dotfiles 
  git clone https://github.com/ahmadkaouk/.dotfiles.git ${HOME}/.dotfiles
}

install_pip3(){

}

install_coc_extensions(){
  echo "Installing CoC Extensions..."
  mkdir -p ~/.config/coc/extensions
  cd ~/.config/coc/extensions
  [ ! -f package.json ] && echo '{"dependencies":{}}'> package.json
  # Change extension names to the extensions you need
  # sudo npm install coc-explorer coc-snippets coc-json coc-actions --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
  npm install coc-explorer coc-snippets coc-json coc-actions --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
}
main(){
  # install_pip3
  # install_node
  # install_pynvim
  download_dotfiles 
  stow -vt nvim zsh tmux 
  install_nvim_plugins
  install_coc_extensions
  
}   
