# !bin/sh

# install required packages
sudo apt-get update
sudo apt-get -y install zsh
sudo apt-get -y install tmux
sudo apt-get -y install ruby

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# make ZSH default login shell for current user
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s "$(command -v zsh)" "${USER}"

# ZSH dependencies
ln -sf $PWD/zsh/.zsh ~
ln -sf $PWD/zsh/.zshenv ~
ln -sf $PWD/zsh/.zshrc ~

# tmux dependencies
ln -sf $PWD/tmux/.tmux.conf ~

# vim dependencies
ln -sf $PWD/vim/.vim ~
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
ln -sf $PWD/vim/.vimrc ~

# git dependencies
ln -sf $PWD/git/.gitconfig

# ruby dependencies
ln -sf $PWD/ruby/.gemrc

echo "Installation was sucessfull! Please login again to see the effects."
