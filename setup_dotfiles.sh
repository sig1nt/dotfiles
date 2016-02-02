#!/bin/bash
ln -sf $HOME/.zshrc zshrc
ln -sf $HOME/.aliases aliases
ln -sf $HOME/.vimrc vimrc
if [ -d ".ssh"]; then
    ln -sf $HOME/.ssh/config ssh_config
fi
