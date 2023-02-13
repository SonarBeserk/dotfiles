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
    read -rp "Do you want to setup time machine https://github.com/cytopia/linux-timemachine backups? [Y/N] " yn
    case $yn in
        [Yy]* )
            if [[ ! -d ~/linux-timemachine ]];
            then
                echo "Cloning time machine repo"
                git clone https://github.com/cytopia/linux-timemachine.git ~/linux-timemachine
            fi
            echo "Updating timemachine repo"
            pushd ~/linux-timemachine > /dev/null || echo "Failing to cd to ~/timemachine"
            git checkout master && git pull
            echo "Building time machine binary"
            sudo make install
            popd > /dev/null || echo "Failing to cd back from ~/timemachine"
            echo "Creating Backups marker"
            touch ~/.check-backups
            echo "Creating backup excludes file"
            sed -i "s/\[\$USER\]/$USER/" "$(pwd)"/excludefrombackups.txt
            ln -s "$(pwd)"/"excludefrombackups.txt" ~/excludefrombackups.txt
            echo "Please create the appropriate cron rule for backups similar to the following rule:"
            # This command runs the timemachine command every 8 hours while excluding the files in the exclude file and ignoring mountpoints to avoid recursive backups
            echo "0 */8 * * * if [[ -e /timemachine ]]; then /usr/local/bin/timemachine ~ /timemachine -- --exclude-from excludefrombackups.txt --one-file-system; fi"
            break;
            ;;

        [Nn]* ) echo "exit" && break;;
        * ) echo "Do you want to setup time machine https://github.com/cytopia/linux-timemachine backups? [Y/N] ";;
    esac
done