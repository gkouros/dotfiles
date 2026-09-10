#!/bin/bash

# Removes old revisions of snaps
# CLOSE ALL SNAPS BEFORE RUNNING THIS
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        sudo snap remove "$snapname" --revision="$revision"
    done


# Remove thumbnails cache
rm -rf ~/.cache/thumbnails/*

# clean system journals older than 3 days
sudo journalctl --vacuum-time=3d

# remove redundant packages and cache
sudo apt-get autoclean
sudo apt-get autoclean
sudo apt-get clean

# remove conda cache
conda clean --all
