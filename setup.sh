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

echo "Building list of dotfiles"
for file in "$dir"/*
do
    dotfiles+=( "$(basename "$file")" )
done

echo "Moving existing files to backup directory"
for file in "$HOME"/*
do
    echo basename "$file"
done

echo "...done"