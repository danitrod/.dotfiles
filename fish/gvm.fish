#!/usr/bin/env fish

# Define a function to run gvm commands using bash
function gvm
    bash -c "source $HOME/.gvm/scripts/gvm; gvm $argv"
end
