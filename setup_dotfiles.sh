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
    vim +PluginInstall +qall
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
ln -sf $PWD/tmux.conf ~/.tmux.conf
ln -sf $PWD/ctags ~/.ctags

# Create link for universal ctags
mkdir ~/.ctags.d
ln -sf $PWD/ctags ~/.ctags.d/main.ctags

# Install Vim Plugins

vim +PluginInstall +qall

# Setup the gitconfig
cp gitconfig ~/.gitconfig

git config --global user.name $name
git config --global user.email $email

if [ $gpg = 'y' ]; then
    echo -n "Signing Key: "
    read skey
    git config --global user.signingkey $skey
    git config --global commit.gpgsign true
fi

source ~/.zshrc
