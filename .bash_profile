if [ -f ~/.bashrc ]; then
  . $HOME/.bashrc
fi

if [ -f ~/.profile ]; then
  . $HOME/.profile
fi


# rbenv config
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# config of '~/.rbenv/plugins/rbenv-binstubs'
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=./vendor/bin:$PATH

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
