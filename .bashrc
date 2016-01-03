# Source globale definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Ignorecase
set completion-ignore-case on

# Keybindings
bind '"\C-n": history-search-forward'
bind '"\C-p": history-search-backward'

# Aliases
alias rm='trash'
alias vi='vim'
alias op='open'
alias so='source'
alias g='git'
alias gu='gitup'
alias ctags="/usr/local/bin/ctags"
alias ctags-rails="/usr/local/bin/ctags -R -f .tags --exclude=.git --exclude=log --exclude=app/assets --exclude=vendor"
alias rb='ruby'
alias be='bundle exec'
alias br='bundle exec ruby'
alias blog='cd ~/Dropbox/jekyll/yoshitaka/ && vi'

# Peco
# peco
peco-select-history() {
  declare l=$(HISTTIMEFORMAT= history | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$READLINE_LINE")
  READLINE_LINE="$l"
  READLINE_POINT=${#l}
}
bind -x '"\C-r": peco-select-history'
