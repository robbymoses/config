#!/bin/bash

# Install Apt-Packages
echo <packages.list
xargs sudo apt-get install -y < packages.list

# Install Scripts
