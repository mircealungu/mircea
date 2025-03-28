#!/bin/bash

[ -f ~/.bash_functions ] && source ~/.bash_functions


rsync -av --delete --exclude='.git/'\
 --exclude='.gitignore'\
 --exclude='.obsidian'\
 --exclude='sync_with_megavault.sh'\
   "$ML_COM_IN_MEGAVAULT" "$ML_COM_IN_GH_FOLDER"

git status


echo ""
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
ask_confirmation "Do you want to commit all and push?"


git commit -a
git push 