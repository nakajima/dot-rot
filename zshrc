source ~/.config/zsh/interactive

export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"
. "$HOME/.cargo/env"
