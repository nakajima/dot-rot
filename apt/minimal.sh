sudo apt update
sudo apt upgrade -y
sudo apt install ripgrep zsh clang gh cmake build-essential -y

# build neovim because the debian package is too old
git clone https://github.com/neovim/neovim --depth=1
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
cd build && cpack -G DEB && sudo dpkg -i neovim/build/nvim-linux-x86_64.deb

curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
sudo chsh $USER -s "$(which zsh)"
