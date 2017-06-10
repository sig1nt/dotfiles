#!/usr/bin/env zsh

# Install Various Programs
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    mkdir -p ~/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
if [ ! -d ~/.oh-my-zsh ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

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
ln -sf $PWD/git_template ~/.git_template
ln -sf $PWD/ctags ~/.ctags

source ~/.zshrc
