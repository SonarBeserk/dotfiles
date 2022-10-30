#!/bin/bash

###################
# Setup.sh
# This script saves a copy of any files with the same name as repo files and symlinks the replacements.
##################

dir=~/dotfiles
backupdir=~/dotfiles_old
dotfiles=()

#################

# Show hidden files when globbing
shopt -s dotglob

echo -n "Creating backup directory"
mkdir -p $backupdir
echo "...done"

echo -n "Building list of dotfiles"
for file in "$dir"/*
do
    name=$(basename "$file")

    # Ignore directories, files with extensions, and dotfiles
    if [ ! -d "$file" ] && [[ $name != *\.* ]];
    then
        dotfiles+=( \."$(basename "$file")" )
    fi
done
echo "..."

echo "Moving existing files to backup directory"
for file in "$HOME"/*
do
    name=$(basename "$file")
    if [[ ${dotfiles[*]} == *"$name"* ]]; then
        echo $file
    fi
done

echo "...done"