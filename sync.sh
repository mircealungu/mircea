#!/bin/bash

[ -f ~/.bash_functions ] && source ~/.bash_functions


rsync -av --delete --exclude='.git/'\
 --exclude='.gitignore'\
 --exclude='.obsidian'\
 --exclude='sync.sh'\
   "$ML_COM_IN_MEGAVAULT" "$ML_COM_IN_GH_FOLDER"

git status


# Get the list of modified files
MODIFIED_FILES=$(git diff --name-only HEAD)

check_and_push() {
    local file_path=$1

    # Check if MODIFIED_FILES contains exactly one line and that line matches file_path
    if [ "$(echo "$MODIFIED_FILES" | wc -l)" -eq 1 ] && [ "$MODIFIED_FILES" == "$file_path" ]; then
        echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
        echo "Only $file_path has been modified. Generating comment and pushing..."
        echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
        git commit -am "update $file_path"
        git push
        exit 0
    fi
}

# Call the function with the file path
check_and_push "thoughtstream.md"


echo ""
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
ask_confirmation "Do you want to commit all and push?"


git commit -a
git push 