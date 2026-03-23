#!/bin/bash

cd "$(dirname "$0")"
[ -f ~/.local_envvars.sh ] && source ~/.local_envvars.sh
[ -f ~/.bash_functions ] && source ~/.bash_functions


rsync -a --delete --exclude='.git/'\
 --exclude='.gitignore'\
 --exclude='.obsidian'\
 --exclude='sync.sh'\
   "$ML_COM_IN_MEGAVAULT" "$ML_COM_IN_GH_FOLDER"


# Get the list of modified files
MODIFIED_FILES=$(git diff --name-only HEAD)

if [ -z "$MODIFIED_FILES" ]; then
    echo "No changes to commit."
    exit 0
fi


check_and_push() {
    local file_path=$1

    # Check if MODIFIED_FILES contains exactly one line and that line matches file_path
    if [ "$(echo "$MODIFIED_FILES" | wc -l)" -eq 1 ] && [ "$MODIFIED_FILES" == "$file_path" ]; then
        git commit -am "update $file_path" --quiet
        git push --quiet
        echo "Pushed: $file_path"
        exit 0
    fi
}

# Call the function with the file path
check_and_push "thoughtstream.md"
check_and_push "links.md"


if [ "$1" = "--yes" ]; then
    git commit -am "update multiple files" --quiet
    git push --quiet
    echo "Pushed: multiple files"
else
    echo ""
    echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
    ask_confirmation "Do you want to commit all and push?"
    git commit -a
    git push
fi