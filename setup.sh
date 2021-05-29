echo "Starting dotfiles setup."

# Install xcode cli tools
xcode-select --install

# Install Homebrew
which -s brew
if [[ $? != 0 ]] ; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew update
	brew upgrade
	brew cask upgrade
fi

# Install brew packages
brew bundle

# Install IBM Cloud CLI
which -s ibmcloud
if [[ $? != 0 ]] ; then
	curl -sL https://raw.githubusercontent.com/IBM-Cloud/ibm-cloud-developer-tools/master/linux-installer/idt-installer | bash
fi

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
rustup target add wasm32-unknown-unknown

# Dev tools
cargo install cargo-edit
cargo install diesel_cli
cargo install cargo-watch
# WASM
cargo install trunk wasm-bindgen-cli

# Fish setup
fish fish/aliases.fish
fish fish/plugins.fish

# Setup NVM
mkdir ~/.nvm

