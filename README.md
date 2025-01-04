# dotfiles

My dotfiles managed by chezmoi

## first time set up

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

brew install chezmoi

chezmoi init git@github.com:gabehoban/dotfiles.git

chezmoi apply -v
```
