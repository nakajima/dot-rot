# other setup stuff

### install homebrew 

```sh
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### link dotfiles

```sh
$ ./local/bin/link-dotfiles
```

### install brew stuff

```sh
$ brew bundle
```

### remove builtin apps from dock

```sh
$ defaults write "com.apple.dock" "persistent-apps" -array; killall Dock
```



