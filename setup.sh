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
rm -rf "/Users/$(whoami)/Library/Application Support/Code/User/snippets"
ln -s $(pwd)/VSCode/snippets/ "/Users/$(whoami)/Library/Application Support/Code/User"

rm /Users/$(whoami)/.zshrc
ln -s $(pwd)/.zshrc /Users/$(whoami)/.zshrc

rm /Users/$(whoami)/.vimrc
ln -s $(pwd)/.vimrc /Users/$(whoami)/.vimrc

rm -rf /Users/$(whoami)/.vim
ln -s $(pwd)/.vim /Users/$(whoami)/.vim

rm /Users/$(whoami)/.hyper.js
ln -s $(pwd)/.hyper.js /Users/$(whoami)/.hyper.js

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
fish fish/aliases.fish
fish fish/plugins.fish

# Setup NVM
mkdir ~/.nvm

# Setup vim Dracula thheme
cd .vim/pack/themes/start && git clone https://github.com/dracula/vim.git dracula
