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
echo "...done"

echo "Moving existing files to $backupdir"
for file in "$HOME"/*
do
    name=$(basename "$file")
    if [[ ${dotfiles[*]} == *"$name"* ]]; then
        echo -n "Moving file $name: "
        mv -n "$file" "$backupdir/$name"
        if [ ! -f "$file" ]; then
            echo "...done"
        else
            echo "Failed to move file"
            exit 
        fi

        cleanedName="${name:1}"
        ln -s $dir/"$cleanedName" ~/"$name"
    fi
done

echo "File moves done"