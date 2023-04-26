# This file automatically configures the system
# Install zsh, starship, tmux, neovim, and vscode configs

# Install ZSH and set as default shell
sudo apt install zsh -y
chsh -s $(which zsh)
cp ./zshrc ~/.zshrc

# Install starship (https://starship.rs)
curl -sS https://starship.rs/install.sh | sh
echo 'eval "$(starship init bash)"' >> ~/.zshrc
mkdir -p ~/.config && touch ~/.config/starship.toml
cp ./starship.toml ~/.config/starship.toml

# Install tmux and copy config
sudo apt install tmux -y
mkdir -p ~/config/tmux
cp ./tmux.conf ~/config/tmux/tmux.conf

# Install neovim and copy config
sudo apt install neovim -y
mkdir -p ~/.config/nvim
cp ./init.vim ~/.config/nvim/init.vim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Open nvim and run :PlugInstall

# Install VSCode
# Import agj.code-porfile into Files/Preferences/Porfiles/Import Porfile

# To add to PATH when downloading from source or using tar
# foc@ubuntu22:~$ sudo cp -r node-v18.12.1-linux-x64/{bin,include,lib,share}  /usr/
