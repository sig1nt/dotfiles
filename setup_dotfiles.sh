#!/usr/local/bin/zsh
ln -sf $PWD/zshrc ~/.zshrc
ln -sf $PWD/aliases ~/.aliases
ln -sf $PWD/vimrc ~/.vimrc
if [ -d "$HOME/.ssh" ]; then
    ln -sf $PWD/ssh_config ~/.ssh/config
fi
source ~/.zshrc
