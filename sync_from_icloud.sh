#!/bin/bash


DESTINATION=/Users/gh/mircealungu

rsync -av --delete --exclude='.git/'\
 --exclude='sync_from_icloud.sh'\
 --exclude='.gitignore'\
 --exclude='.obsidian'\
 --exclude='sync_from_icloud.sh'\
  /Users/mircea/Library/Mobile\ Documents/iCloud\~md\~obsidian/Documents/Megavault/mircealungu.com/ $DESTINATION



