# Add Homebrew to Path
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin

# Add OpenJDK to Path
fish_add_path /opt/homebrew/opt/openjdk/bin

# Add Go binaries to Path
fish_add_path /Users/(whoami)/go/bin/

# Add Rust to Path
fish_add_path ~/.cargo/bin

# Add GOPATH variable
set -Ux GOPATH /Users/(whoami)/go

# Setup Nvim Treesitter
nvim --headless +"TSInstall lua" +q
nvim --headless +"TSInstall vim" +q
nvim --headless +"TSInstall rust" +q
nvim --headless +"TSInstall go" +q
nvim --headless +"TSInstall python" +q
nvim --headless +"TSInstall java" +q
nvim --headless +"TSInstall javascript" +q
nvim --headless +"TSInstall typescript" +q
nvim --headless +"TSInstall bash" +q
nvim --headless +"TSInstall fish" +q
nvim --headless +"TSInstall html" +q
nvim --headless +"TSInstall css" +q
