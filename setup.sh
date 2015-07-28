#!/bin/bash

# link files to $HOME
DOT_FILES={.gitignore .gitconfig .gitignore_global .peco .vim .vimrc .tmux_conf}

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done
