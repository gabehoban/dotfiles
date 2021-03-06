#!/usr/bin/env zsh
echo "\nš Starting Python Setup\n"

python_version = 3.9.4

pyenv install $python_version
pyenv global $python_version

source ~/.zshrc 

echo "š pyenv version"
pyenv versions

echo "š python version"
python -V
