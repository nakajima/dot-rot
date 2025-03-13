# There's no brew on arm linux

sudo apt install -y \
	jq \
	wget \
	zsh-autosuggestions \
	zsh-syntax-highlighting \
	neovim \
	lua5.4 \
	build-essential \
	ripgrep 

# that's enough sudo for now
sudo -k

echo "installing atuin..."
curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh | sh

echo "installing starship..."
curl -sS https://starship.rs/install.sh | sh

echo "install lua-language-server..."
mkdir lua-language-server
cd lua-language-server
wget https://github.com/LuaLS/lua-language-server/releases/download/3.13.8/lua-language-server-3.13.8-linux-arm64.tar.gz	
tar -xf lua-language-server-3.13.8-linux-arm64.tar.gz
