# Add Homebrew to Path
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin

# Add OpenJDK to Path
fish_add_path /opt/homebrew/opt/openjdk/bin

# Add Go binaries to Path
fish_add_path /Users/(whoami)/go/bin/

# Add GOPATH variable
set -Ux GOPATH /Users/(whoami)/go

# Enable Docker buildkit
set -Ux DOCKER_BUILDKIT 1
