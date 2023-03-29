# Add OpenJDK to Path
fish_add_path /opt/homebrew/opt/openjdk/bin

# Add Go binaries to Path
fish_add_path /Users/(whoami)/go/bin/

# Add Rust to Path
fish_add_path ~/.cargo/bin

# Add GOPATH variable
set -Ux GOPATH /Users/(whoami)/go

# Setup git
git config --global user.name "Daniel T. Rodrigues"
git config --global user.email "danitrod@protonmail.com"
git config --global pull.rebase true
