#!/bin/bash

# Check if nvim is installed
if command -v nvim >/dev/null 2>&1; then
    # If nvim is found, do a git pull
    echo "nvim found in PATH, checking for updates..."
    cd ~/ext_repos/neovim
    git pull origin stable

    # Check if changes were pulled
    if [ "$(git diff --stat)" != '' ]; then
        echo "Changes pulled, rebuilding..."
        make CMAKE_BUILD_TYPE=Release
        sudo make install
    else
        echo "No changes pulled, exiting."
        exit 0
    fi
else
    # If nvim is not found, clone the repo and build
    echo "nvim not found in PATH, cloning repository..."
    mkdir -p ~/ext_repos
    cd ~/ext_repos
    git clone https://github.com/neovim/neovim
    cd neovim
    git checkout stable

    # Build and install
    make CMAKE_BUILD_TYPE=Release
    sudo make install
fi
