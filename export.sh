# Export vscode extensions
code --list-extensions | xargs -L 1 echo code --install-extension | cat >> setup.sh

