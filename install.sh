#!/bin/bash

###################
# Install.sh
# This script attempts to install all preconfigured programs
##################

# Install basic programs
echo "Updating apt repos and checking for upgrades"
sudo apt update
sudo apt upgrade

echo "Install libnotify-bin for alert alias"
sudo apt install libnotify-bin

echo "Installing git / Golang"
sudo apt install git git-gui
sudo apt install golang

# Install starship 

echo "Installing shell prompt"

while true; do
    read -rp "Have you installed a nerd font? https://www.nerdfonts.com/font-downloads [Y/N] " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Have you installed a nerd font? https://www.nerdfonts.com/font-downloads [Y/N]";;
    esac
done

curl -sS https://starship.rs/install.sh | sh