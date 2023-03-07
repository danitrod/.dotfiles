# Add OpenJDK to Path
fish_add_path /opt/homebrew/opt/openjdk/bin

# Add Go binaries to Path
fish_add_path /Users/(whoami)/go/bin/

# Add Rust to Path
fish_add_path ~/.cargo/bin

# Add GOPATH variable
set -Ux GOPATH /Users/(whoami)/go
