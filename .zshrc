# -- Terminal, git settings ---------------------
[ -f ~/.bashrc ] && source ~/.bashrc

# Colors ls should use for folders, files, symlinks etc, see `man ls` and
# search for LSCOLORS
export LSCOLORS=GxFxCxDxBxegedabagaced

# Force ls to use colors (G) and use humanized file sizes (h) and show hidden files as well (a)
alias ls='ls -Gha'

# ensure grep doesn't use additional flags as that interferes with DSSH
export GREP_OPTIONS=''

# Set default prompt, with git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

setopt PROMPT_SUBST
PROMPT=$'%1d\e[0;32m$(parse_git_branch)\e[0m: '

# STARTUP: ON opening new window or tab: IF current directory is NOT within src, cd into src
DIRECTORY=$(pwd)
if [[ ${DIRECTORY} != *"src"* ]] ; then
  cd ~/src/
fi

# autocomplete for git:
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# run command x times
run() {
    number=$1
    shift
    for i in `seq $number`; do
      $@
    done
}

# -- Aliases --------------------------------------

# bundle exec turns into be
alias be="bundle exec"

# Ensures that Atom doesn't open several instances
alias atom="open -a /Applications/Atom.app/Contents/MacOS/Atom"

# shortcut to src folder
alias home='cd ~/src'
