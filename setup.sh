echo "Starting dotfiles setup."

# Install xcode cli tools
xcode-select --install

# Install Homebrew if not already installed
which -s brew
if [[ $? != 0 ]] ; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	# Add brew to path
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/danitrod/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"
	brew update
	brew upgrade
	brew upgrade --cask
fi

# Install brew packages
brew bundle

# Symlink config files 
rm "/Users/$(whoami)/Library/Application Support/Code/User/settings.json"
ln -s $(pwd)/VSCode/settings.json "/Users/$(whoami)/Library/Application Support/Code/User/settings.json"
rm "/Users/$(whoami)/Library/Application Support/Code/User/keybindings.json"
ln -s $(pwd)/VSCode/keybindings.json "/Users/$(whoami)/Library/Application Support/Code/User/keybindings.json"
rm -r "/Users/$(whoami)/Library/Application Support/Code/User/snippets"
ln -s $(pwd)/VSCode/snippets/ "/Users/$(whoami)/Library/Application Support/Code/User"

rm -r /Users/$(whoami)/.config/nvim
ln -s $(pwd)/nvim/ /Users/$(whoami)/.config/nvim

rm /Users/$(whoami)/.config/starship.toml
ln -s $(pwd)/starship.toml /Users/$(whoami)/.config/starship.toml

# Install rust and cargo tools
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustup target add wasm32-unknown-unknown

# Dev tools
cargo install cargo-edit
cargo install diesel_cli
cargo install cargo-watch
# WASM
cargo install trunk wasm-bindgen-cli wasm-pack

# Fish setup
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

rm /Users/$(whoami)/.config/fish/config.fish
ln -s $(pwd)/config.fish /Users/$(whoami)/.config/fish/
fish fish/*

# Setup NVM
mkdir ~/.nvm

# Setup Neovim Packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Setup iterm2 fish integration
curl -L https://iterm2.com/shell_integration/fish \
-o ~/.iterm2_shell_integration.fish

# Language servers
npm i -g bash-language-server
go install golang.org/x/tools/gopls@latest
pip3 install python-lsp-server
pip3 install cmake-language-server
npm i -g vscode-langservers-extracted
npm install -g typescript typescript-language-server
npm install -g dockerfile-language-server-nodejs
