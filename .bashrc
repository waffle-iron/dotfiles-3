# Source globale definitions
if [ -f /etc/bashrc ]; then
  source /etc/bashrc
fi

# Keybindings
bind '"\C-n": history-search-forward'
bind '"\C-p": history-search-backward'

# Aliases
alias ls='ls -F'
alias cp='cp -i'
alias mv='mv -i'
alias rm='trash'
alias vi='vim'
alias op='open'
alias so='source'
alias g='git'
alias git='hub'
alias tigs='tig status'
alias ctags="/usr/local/bin/ctags"
alias ctags-rails="/usr/local/bin/ctags -R -f .tags --exclude=.git --exclude=log --exclude=app/assets --exclude=vendor"
alias rb='ruby'
alias r='bin/rails'
alias b='bundle'
alias be='bundle exec'
alias br='bundle exec ruby'
alias blog='cd ~/Dropbox/jekyll/yoshitaka/ && vi'

# peco
export HISTCONTROL="ignoredups"
peco-history() {
    local NUM=$(history | wc -l)
    local FIRST=$((-1*(NUM-1)))

    if [ $FIRST -eq 0 ] ; then
        history -d $((HISTCMD-1))
        echo "No history" >&2
        return
    fi  

    local CMD=$(fc -l $FIRST | sort -k 2 -k 1nr | uniq -f 1 | sort -nr | sed -E 's/^[0-9]+[[:blank:]]+//' | peco | head -n 1)

    if [ -n "$CMD" ] ; then
        history -s $CMD

        if type osascript > /dev/null 2>&1 ; then
            (osascript -e 'tell application "System Events" to keystroke (ASCII character 30)' &)
        fi  
    else
        history -d $((HISTCMD-1))
    fi  
}
bind -x '"\C-r":peco-history'

# git-completion
if [ -f $HOME/.git-completion.bash ]; then
  source $HOME/.git-completion.bash
  __git_complete g __git_main
fi

# gibo
if [ -f $HOME/.gibo-completion.bash ]; then
  source $HOME/.gibo-completion.bash
fi
