#!/usr/bin/env bash

# Create bin directory

if [[ ! -d "$HOME/.local/bin" ]] ; then
    mkdir -p $HOME/.local/bin
fi

# Add to .bashrc

if [[ ! ${PATH%%:*} == "$HOME/.local/bin" ]] ; then
    printf -- "[[ -d \"\$HOME/.local/bin\" ]] && PATH=\"\$HOME/.local/bin:\$PATH\"" >> .bashrc
fi

# Add to .profile

## Create file if it does not exist
if [[ ! -f "$HOME/.profile" ]] ; then
    touch .profile
fi

## Search for the string on the file
grep "source \$HOME/.bashrc" .profile > /dev/null 2>&1

## If not found (exit code 1), append it
if [[ $? -eq 1 ]] ; then # Not found
    echo "source \$HOME/.bashrc" >> $HOME/.profile
fi

# Create src directory

if [[ ! -d "$HOME/.local/src" ]] ; then
    mkdir -p $HOME/.local/src
fi

# Clone repo

if [[ -d "$HOME/.local/src/dcc-tools" ]] ; then
    rm $HOME/.local/src/dcc-tools
fi

git clone -b ssh-client-mode https://github.com/tvillega/dcc-tools.git $HOME/.local/src/dcc-tools

# Enable bin

if [[ -f ${HOME}/.local/bin/dcc-tools ]] ; then
    rm -rf $HOME/.local/bin/dcc-tools
fi

ln -s ${HOME}/.local/src/dcc-tools/dcc-tools ${HOME}/.local/bin/dcc-tools
