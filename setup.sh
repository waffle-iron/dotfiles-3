#!/bin/sh

# symlink prezto
if [ ! -L ~/.zprezto -a -d ~/dotfiles/prezto ]; then
    ln -s ~/dotfiles/prezto ~/.zprezto
fi

for file in .??*
do
  [ "$file" = ".git" ] && continue

    ln -sv "$HOME/dotfiles/$file" "$HOME/$file"
done
