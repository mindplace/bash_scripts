# Set default prompt
export PS1="\n\W : "

DIRECTORY=$(pwd)
# STARTUP: ON opening new window or tab: IF current directory is NOT within Programming, cd into Programming
if [[ ${DIRECTORY} != *"Programming"* ]] ; then
  cd /Users/Mac/Google\ Drive/Documents/Programming/
fi

# Managing Rbenv
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"

# Rbenv autocomplete and shims
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Path for RBENV
test -d "$HOME/.rbenv/" && PATH="$HOME/.rbenv/bin:$PATH"

# Path for Homebrew
test -d /usr/local/bin && export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

# Path for Heroku
test -d /usr/local/heroku/ && export PATH="/usr/local/heroku/bin:$PATH"

# Set default text editor
# export EDITOR=/Applications/Atom

# Colors ls should use for folders, files, symlinks etc, see `man ls` and
# search for LSCOLORS
export LSCOLORS=GxFxCxDxBxegedabagaced
# Force ls to use colors (G) and use humanized file sizes (h)
alias ls='ls -Gh'

# Force grep to always use the color option and show line numbers
export GREP_OPTIONS='--color=always'

# autocomplete for git:
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# bundle exec turns into be
alias be="bundle exec"

# shortcut for opening files and folders with macvim
alias macvim='open -a macvim'

# shortcut to Programming folder
alias home='cd /Users/Mac/Google\ Drive/Documents/Programming'
