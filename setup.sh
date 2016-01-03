#!/bin/sh

# symlink prezto
if [ ! -L ~/.zprezto -a -d ~/dotfiles/prezto ]; then
    ln -s ~/dotfiles/prezto ~/.zprezto
fi

DOT_FILES=(
  .git_tmp
  .peco
  .vim
  .bashrc
  .bash_profile
  .csscomb.json
  .ctags
  .editorconfig
  .gemrc
  .gitconfig
  .gitignore_global
  .irbrc
  .jsbeautifyrc
  .jshintrc
  .profile
  .pryrc
  .rubocop.yml
  .sass-lint.yml
  .scss-lint.yml
  .tigrc
  .tmux
  .tmux.conf
  .vimrc
  )

for file in ${DOT_FILES[@]}
do
  if [ -e $HOME/$file ]; then
    echo "既にファイルが存在します: $file"
  else
    ln -s $HOME/dotfiles/$file $HOME/$file
    echo "シンボリックリンクを貼りました: $file"
  fi
done
