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
ln -sf $PWD/tmux/.tmux ~

# TPM for tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# vim Dir
ln -sf $PWD/vim/.vim ~

# dein.vim plugin manager
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $PWD/installer.sh
sh $PWD/installer.sh ~/.vim/dein

# override the system vim
sudo apt-get install neovim

# Config for nvim
mkdir -p ~/.config/
ln -sf $PWD/config/nvim ~/.config/

# git dependencies
ln -sf $PWD/git/.gitignore ~/.gitignore
ln -sf $PWD/git/.gitconfig.example ~/.gitconfig

# ruby dependencies
ln -sf $PWD/ruby/.gemrc

echo "Installation was sucessfull! Please start session again to see effects."
