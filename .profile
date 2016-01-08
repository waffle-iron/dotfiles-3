# Prompt
export PS1='\[\e[0;32m\]\w\[\e[0;36m\]$(__git_ps1) \[\e[0;35m\]$\[\e[m\] '

# TERM environment
export TERM=xterm-256color-italic

# editor
export PATH=/usr/local/bin:$PATH

# locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# git
# prompt
if [ -f $HOME/.git-prompt.sh ]; then
  source $HOME/.git-prompt.sh
fi
if [ -f $HOME/.git-completion.sh ]; then
  source $HOME/.git-completion.sh
fi

# PATH
export PATH=$PATH:$HOME/bin
export PATH=/usr/local/bin:$PATH

# rbenv config
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# config of '~/.rbenv/plugins/rbenv-binstubs'
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=./vendor/bin:$PATH

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
