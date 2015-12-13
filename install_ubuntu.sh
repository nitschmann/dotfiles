# !/bin/sh

# install required packages
sudo apt-get update
sudo apt-get -y install zsh
sudo apt-get -y install tmux
sudo apt-get -y install ruby

# make ZSH default login shell for current user
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s "$(command -v zsh)" "${USER}"

# ZSH dependencies
ln -s ./zsh/.zsh ~
ln -s ./zsh/.zshenv ~
ln -s ./zsh/.zshrc ~

# tmux dependencies
ln -s ./tmux/.tmux.conf ~

# vim dependencies
ln -s ./vim/.vim ~
ln -s ./vim/.vimrc

# git dependencies
ln -s ./git/.gitconfig
ln -s ./git/.gitignore

# ruby dependencies
ln -s ./ruby/.gemrc

echo "Installation was sucessfull!\n\n\Please login again to see the effects."
