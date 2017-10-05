#!/usr/bin/env zsh

# Get User Info
echo -n "Fullname for the computer: "
read name
echo -n "Email for the computer: "
read email
echo -n "Use GPG [y/N]: "
read gpg

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
ln -sf $PWD/tmux_conf ~/.tmux_conf
ln -sf $PWD/git_template ~/.git_template
ln -sf $PWD/ctags ~/.ctags
ln -sf $PWD/indent ~/.indent.pro

sed "s/##NAME/$name/g;s/##EMAIL/$email/g" < gitconfig_template > ~/.gitconfig

source ~/.zshrc
