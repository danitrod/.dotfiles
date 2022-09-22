# .dotfiles

## Introduction

These are my dotfiles. The repo includes setup for installing runtimes, desktop applications, command line tools, themes and plugins I use.

To get started, clone this repo and all its submodules into your home folder and cd into it.

`git clone --recurse-submodules https://github.com/danitrod/.dotfiles /Users/$(whoami)/.dotfiles && cd /Users/$(whoami)/.dotfiles`

## Setting up

`sh setup.sh`

## Exporting

- `Brewfile`: `brew bundle dump --describe`
- VSCode extensions: `sh VSCode/export_extensions.sh`

## Notes on Neovim

- On the first run Packer will throw some errors as the plugins are not yet installed. Simply wait
for the installation, exit and enter nvim again. 
- Use the command `TSInstall <lang>` for each language that will be used.
