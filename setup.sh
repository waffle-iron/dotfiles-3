#!/bin/sh
if [ ! -L ~/.zprezto -a -d ~/dotfiles/prezto ]; then
    ln -s ~/dotfiles/prezto ~/.zprezto
fi


for file in .z* .gitconfig .gitignore .gitignore_global .peco .vim .vimrc .tmux.conf .jshintrc; do
ln - s $PWD/$file ~/$file
done

# prezto
## .z系のファイルを＄HOMEにsymlink
