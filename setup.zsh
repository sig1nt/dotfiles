# Download oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

# Add custom theme
ln -sf $PWD/zsh_theme ~/.oh-my-zsh/themes/custom.zsh-theme
ln -sf $PWD/zshrc ~/.zshrc

source ~/.zshrc
