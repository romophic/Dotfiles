#!/bin/bash

cat ~/.cache/zsh/chpwd-recent-dirs \
  | sed -e 's/^..\(.*\)./\1/g' \
  | while read line
do
  if [ -d "$line" ]; then
    echo "\$'$line'"
  fi
done
