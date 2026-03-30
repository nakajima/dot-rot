#! /usr/bin/bash
sudo apt update
sudo apt upgrade -y

echo "-----> installing packages"
sudo apt install ripgrep zsh clang gh cmake build-essential software-properties-common zsh-autosuggestions zsh-syntax-highlighting python-dev python-pip python3-dev python3-pip -y

echo "-----> installing neovim"
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

echo "-----> installing atuin"
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
sudo chsh $USER -s "$(which zsh)"

echo "-----> installing starship"
curl -sS https://starship.rs/install.sh | sh
