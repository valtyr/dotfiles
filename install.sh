#! /bin/bash
set -euo pipefail

sudo apt update
sudo apt install fish neovim hub mosh

chsh $USER -s $(which fish)

git clone https://github.com/valtyr/dotfiles.git ~/.dotfiles

mkdir -p ~/.config
mkdir -p ~/.config/nvim
mkdir -p ~/.config/fish

ln -fs ~/.dotfiles/init.vim ~/.config/nvim/init.vim
ln -fs ~/.dotfiles/config.fish ~/.config/fish/config.fish
ln -fs ~/.dotfiles/update.fish ~/.config/fish/functions/update-dotfiles.fish

# curl -sL install-node.now.sh/lts | sudo bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim -E -c PlugInstall -c q
