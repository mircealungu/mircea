#!/bin/bash


rsync -av --delete --exclude='.git/'\
 --exclude='sync_from_icloud.sh'\
 --exclude='.gitignore'\
 --exclude='.obsidian'\
 --exclude='sync_with_megavault.sh'\
   "$ML_COM_IN_MEGAVAULT" "$ML_COM_IN_GH_FOLDER"

git status