# !bin/sh

# installation for Mac OS X Systems
# Requirements: Git and Homebrew pre-installed

# install required packages
brew update
brew install zsh
brew install tmux
brew install node

# Ruby version manager
brew install rbenv

# Python version manager
brew install pyenv
brew install pyenv-virtualenv

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# make ZSH default login shell for current user
chsh -s /usr/local/bin/zsh

# ZSH dependencies
ln -sf $PWD/zsh/.zsh ~
ln -sf $PWD/zsh/.zshenv ~
ln -sf $PWD/zsh/.zshrc ~

source ~/.zshrc

# tmux dependencies
ln -sf $PWD/tmux/.tmux.conf ~
ln -sf $PWD/tmux/.tmux ~

# TPM for tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# vim Dir
ln -sf $PWD/vim/.vim ~

# dein.vim plugin manager
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $PWD/installer.sh
sh $PWD/installer.sh ~/.vim/dein

# override the system vim
brew install neovim

# Config for nvim
mkdir -p ~/.config/
ln -sf $PWD/config/nvim ~/.config/

# the_silver_searcher for Ag in vim
brew install the_silver_searcher

# install nodenv for Node.JS version management
brew install nodenv

# git dependencies
ln -sf $PWD/git/.gitignore ~/.gitignore
cp $PWD/git/.gitconfig.example ~/.gitconfig

# ruby dependencies
ln -sf $PWD/ruby/.gemrc ~

# global Ruby version and solargraph Gem
rbenv install 2.6.6
rbenv global 2.6.6
rbenv rehash
gem install solargraph
ln -sf $(which solargraph) /usr/local/bin /usr/local/bin

# Install specific Python versions (NOTE: Needs to be updated from time to time) for NeoVim support
pyenv install 3.7.0
pyenv install 2.7.15
pyenv global 3.7.0
pip install neovim

pyenv virtualenv 2.7.15 neovim2
pyenv activate neovim2
pip install neovim

pyenv virtualenv 3.7.0 neovim3
pyenv activate neovim3
pip install neovim

echo "Installation was sucessfull! Please start session again to see effects."
