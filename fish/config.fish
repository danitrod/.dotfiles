starship init fish | source
if status --is-login
	set -gx PATH $PATH $HOME/.cargo/env
end

source ~/.iterm2_shell_integration.fish
source ~/.dotfiles/fish/aliases.fish
source ~/.pat.fish
