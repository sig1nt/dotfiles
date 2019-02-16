#!/usr/bin/env bash

# Get User Info
echo -n "Fullname for the computer: "
read name
echo -n "Email for the computer: "
read email

shell_opt=$(basename $SHELL)

# Install Vundle
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    mkdir -p ~/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Setup Vim Folder
mkdir -p ~/.vim/{swp,backup}

# Handle recursive symlink on folder
if [ -h ~/.git_template ]; then
    rm ~/.git_template
fi

# Link in dotfiles
ln -sf $PWD/aliases ~/.aliases
ln -sf $PWD/vimrc ~/.vimrc
ln -sf $PWD/tmux.conf ~/.tmux.conf
ln -sf $PWD/ctags ~/.ctags
ln -sf $PWD/git_template ~/.git_template

# Create link for universal ctags
mkdir -p ~/.ctags.d
ln -sf $PWD/ctags ~/.ctags.d/main.ctags

# Install Vim Plugins 
vim +PluginInstall +qall

# Setup the gitconfig
# cp gitconfig ~/.gitconfig

# git config --global user.name $name
# git config --global user.email $email

if [ -f ./setup.$shell_opt ]; then
    source ./setup.$shell_opt
fi

if [ -f ./setup.$(hostname).sh ]; then
    cat ./setup.$(hostname).sh >> ~/.setup.local
fi
