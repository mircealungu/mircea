#!/bin/bash

[ -f ~/.bash_functions ] && source ~/.bash_functions


rsync -av --delete --exclude='.git/'\
 --exclude='.gitignore'\
 --exclude='.obsidian'\
 --exclude='sync_with_megavault.sh'\
   "$ML_COM_IN_MEGAVAULT" "$ML_COM_IN_GH_FOLDER"

git status

MODIFIED_FILES=$(git diff --name-only HEAD)

FILE_PATH="thoughtstream.md"
# Check if only the specified file is modified
if [ "$MODIFIED_FILES" == "$FILE_PATH" ]; then
    echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
    echo "Only $FILE_PATH has been modified. Generating comment and pushing...".
    echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
    git commit -am "update thoughtstream"
    git push
    exit 0
else
    echo "Other files have been modified or $FILE_PATH has not been modified."
    exit 1
fi



echo ""
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
ask_confirmation "Do you want to commit all and push?"


git commit -a
git push 