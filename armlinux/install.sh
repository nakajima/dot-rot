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
	nixpkgs#clang \
	nixpkgs#sourcekit-lsp
