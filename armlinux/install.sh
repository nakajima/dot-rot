# There's no brew on arm linux
nix profile install \
  nixpkgs#jq \
  nixpkgs#wget \
  nixpkgs#neovim \
  nixpkgs#ripgrep \
  nixpkgs#zsh \
  nixpkgs#zsh-autosuggestions \
  nixpkgs#zsh-syntax-highlighting \
  nixpkgs#atuin \
  nixpkgs#starship \
  nixpkgs#lua-language-server \
	nixpkgs#ncurses.dev \
	nixpkgs#openssl.dev \
	nixpkgs#linuxHeaders \
	nixpkgs#libressl.dev --priority 6 \
	nixpkgs#libz.dev \
	nixpkgs#screen \
	nixpkgs#tree \
	nixpkgs#llvm \
	nixpkgs#clang \
	nixpkgs#clang-tools \
	nixpkgs#lld
