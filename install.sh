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
        [Nn]* ) break;;
        * ) echo "Have you installed a nerd font? https://www.nerdfonts.com/font-downloads [Y/N] ";;
    esac
done

curl -sS https://starship.rs/install.sh | sh

while true; do
    read -rp "Do you want to setup time machine https://github.com/cytopia/linux-timemachine backups? [Y/N]" yn
    case $yn in
        [Yy]* )
            echo "Cloning time machine repo"
            git clone https://github.com/cytopia/linux-timemachine.git ~/linux-timemachine
            cd ~/linux-timemachine || echo "Failing to cd to ~/timemachine" && exit
            git checkout master && git pull
            echo "Building time machine binary"
            sudo make install
            echo "Creating backups marker"
            touch ~/.check-backups
            echo "Please create the appropriate cron rule based on the following example rule:"
            echo "0 2 * * * if [[ -e /backup/mounted ]]; then /usr/local/bin/timemachine /home/someuser /backup; fi"
            break;
            ;;

        [Nn]* ) break;;
        * ) echo "Do you want to setup time machine https://github.com/cytopia/linux-timemachine backups?";;
    esac
done