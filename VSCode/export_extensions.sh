## Adds commands to install all your vscode extensions to the setup script

SETUP_SCRIPT_PATH="/Users/$(whoami)/.dotfiles/setup.sh"

# Remove previous extension install commands from setup
sed -i .sed '/# Install VSCode extensions/d' $SETUP_SCRIPT_PATH
sed -i .sed '/code --install-extension/d' $SETUP_SCRIPT_PATH
rm $SETUP_SCRIPT_PATH.sed

# Export vscode extensions
echo "# Install VSCode extensions" | cat >> $SETUP_SCRIPT_PATH
code --list-extensions | xargs -L 1 echo code --install-extension | cat >> $SETUP_SCRIPT_PATH

