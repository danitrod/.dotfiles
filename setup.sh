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

# Install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Symlink config files 
rm /Users/$(whoami)/Library/Application\ Support/Code/User/settings.json
ln -s VSCode/settings.json /Users/$(whoami)/Library/Application\ Support/Code/User/settings.json
rm /Users/$(whoami)/Library/Application\ Support/Code/User/keybindings.json
ln -s VSCode/keybindings.json /Users/$(whoami)/Library/Application\ Support/Code/User/keybindings.json
rm -rf /Users/$(whoami)/Library/Application\ Support/Code/User/snippets
ln -s VSCode/snippets/ /Users/$(whoami)/Library/Application\ Support/Code/User

rm /Users/$(whoami)/.zshrc
ln -s .zshrc /Users/$(whoami)/.zshrc

rm /Users/$(whoami)/.vimrc
ln -s .vimrc /Users/$(whoami)/.vimrc

