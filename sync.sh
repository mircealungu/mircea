#!/bin/bash

cd "$(dirname "$0")"
[ -f ~/.local_envvars.sh ] && source ~/.local_envvars.sh


rsync -a --delete --exclude='.git/'\
 --exclude='.gitignore'\
 --exclude='.obsidian'\
 --exclude='sync.sh'\
 --exclude='assets/css/'\
   "$ML_COM_VAULT" "$ML_COM_REPO"

# Check for new untracked files
NEW_FILES=$(git ls-files --others --exclude-standard)

if [ -n "$NEW_FILES" ]; then
    if [ "$1" = "--non-interactive" ]; then
        echo "New files detected — run interactive sync to review:"
        echo "$NEW_FILES"
        exit 1
    else
        echo "New untracked files:"
        echo "$NEW_FILES"
        echo ""
        read -p "Add and commit these new files? (y/n) " answer
        [ "$answer" != "y" ] && exit 0
        git add $NEW_FILES
    fi
fi

# Get the list of modified tracked files
MODIFIED_FILES=$(git diff --name-only HEAD)

if [ -z "$MODIFIED_FILES" ] && [ -z "$(git diff --name-only --cached HEAD)" ]; then
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


if [ "$1" = "--non-interactive" ]; then
    echo "Changed: $MODIFIED_FILES"
    git commit -am "update multiple files" --quiet
    git push --quiet
    echo "Pushed."
else
    echo ""
    git --no-pager diff --stat HEAD
    echo ""
    read -p "Commit all and push? (y/n) " answer
    [ "$answer" != "y" ] && exit 0
    git commit -a
    git push
fi
