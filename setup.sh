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

# Install cargo tools
cargo install cargo-edit
cargo install diesel_cli
cargo install cargo-watch

# Fish setup
fish aliases.fish
fish plugins.fish

# Setup NVM
mkdir ~/.nvm

# Install VSCode extensions
code --install-extension 2gua.rainbow-brackets
code --install-extension aaron-bond.better-comments
code --install-extension ahmadalli.vscode-nginx-conf
code --install-extension alexcvzz.vscode-sqlite
code --install-extension arthurwang.vsc-prolog
code --install-extension bbenoist.vagrant
code --install-extension bmewburn.vscode-intelephense-client
code --install-extension bradlc.vscode-tailwindcss
code --install-extension bungcip.better-toml
code --install-extension cjhowe7.laravel-blade
code --install-extension codingyu.laravel-goto-view
code --install-extension dbaeumer.vscode-eslint
code --install-extension dracula-theme.theme-dracula
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension EditorConfig.EditorConfig
code --install-extension esbenp.prettier-vscode
code --install-extension ExodiusStudios.comment-anchors
code --install-extension flowtype.flow-for-vscode
code --install-extension Gimly81.matlab
code --install-extension golang.go
code --install-extension GrapeCity.gc-excelviewer
code --install-extension GraphQL.vscode-graphql
code --install-extension HookyQR.beautify
code --install-extension IBM.ibmcloud-account
code --install-extension KevinRose.vsc-python-indent
code --install-extension matklad.rust-analyzer
code --install-extension mattn.Lisp
code --install-extension mikestead.dotenv
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-mssql.mssql
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension ms-toolsai.jupyter
code --install-extension ms-vscode.cpptools
code --install-extension mtxr.sqltools
code --install-extension NuclleaR.vscode-extension-auto-import
code --install-extension octref.vetur
code --install-extension oderwat.indent-rainbow
code --install-extension onecentlin.laravel-blade
code --install-extension PKief.material-icon-theme
code --install-extension prui.template-generator-vscode
code --install-extension raynigon.nginx-formatter
code --install-extension rebornix.prolog
code --install-extension rebornix.ruby
code --install-extension redhat.vscode-commons
code --install-extension redhat.vscode-xml
code --install-extension redhat.vscode-yaml
code --install-extension shanoor.vscode-nginx
code --install-extension Sir2B.lispbeautifier
code --install-extension stef-k.laravel-goto-controller
code --install-extension stkb.rewrap
code --install-extension TakumiI.markdowntable
code --install-extension theumletteam.umlet
code --install-extension vscode-icons-team.vscode-icons
code --install-extension wingrunr21.vscode-ruby
code --install-extension xaver.clang-format
code --install-extension yzane.markdown-pdf
