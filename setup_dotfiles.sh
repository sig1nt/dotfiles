#!/usr/bin/env zsh

# Install Various Programs
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Add custom theme
ln -sf $PWD/zsh_theme ~/.oh-my-zsh/themes/custom.zsh-theme

# Setup Vim Folder
mkdir -p ~/.vim/{swp,backup}

# Link in dotfiles
ln -sf $PWD/zshrc ~/.zshrc
ln -sf $PWD/aliases ~/.aliases
ln -sf $PWD/vimrc ~/.vimrc
ln -sf $PWD/gitconfig ~/.gitconfig
ln -sf $PWD/tmux_conf ~/.tmux_conf

source ~/.zshrc
