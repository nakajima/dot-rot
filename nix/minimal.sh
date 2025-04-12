which nix || sh "curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --no-confirm"

. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

nix profile install \
  nixpkgs#neovim \
  nixpkgs#ripgrep \
  nixpkgs#zsh \
  nixpkgs#zsh-autosuggestions \
  nixpkgs#zsh-syntax-highlighting \
  nixpkgs#atuin \
  nixpkgs#clang \
  nixpkgs#gh \
  nixpkgs#yaml-language-server

sudo chsh nakajima -s "$(which nix)"
