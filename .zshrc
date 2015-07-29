#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

export EDITOR=/usr/local/bin/vim
export VISUAL=/usr/local/bin/vim

alias rm='trash'
alias chrome='open -a "Google Chrome"'
alias rb='ruby'
alias sb='seeing_is_believing'

# peco 設定は~/.peco/config.json
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# rbenvの設定
if which rbenv > /dev/null; then
    eval "$(rbenv init -)";
fi

# ~/.rbenv/plugins/rbenv-binstubsの設定
# bundlerで管理しているGemコマンドを`bundle exec`なしで使える
export PATH=./vendor/bin:$PATH
alias be='bundle exec'

# nodebrewのパスを通す
export PATH=$HOME/.nodebrew/current/bin:$PATH
