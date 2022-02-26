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

# STARTUP: start in the right folder
DIRECTORY=$(pwd)
if [[ ${DIRECTORY} != *"omar"* ]] ; then
  cd ~/src/omar
fi

# autocomplete for git:
autoload -Uz compinit && compinit

# run command x times
run() {
    number=$1
    shift
    for i in `seq $number`; do
      $@
    done
}

# Ensure Ruby executables go to the right place
export GEM_HOME="$HOME/.gem"

# Get RBENV to find its place
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/
export LDFLAGS="-I/usr/local/opt/openssl/include -L/usr/local/opt/openssl/lib"

# Ensure node version manager is setup
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# -- Aliases --------------------------------------

# bundle exec turns into be
alias be="bundle exec"

# Ensures that Atom doesn't open several instances
alias atom="open -a /Applications/Atom.app/Contents/MacOS/Atom"

# shortcut to src folder
alias home='cd ~/src'

# -- Aptible --------------------------------------
# Need to export this....
# export ADMIN_EMAIL=esther@brightside.com

prod() {
  # production env
  aptible ssh --app omar-production bundle exec rails c
}

stage() {
  # Real staging environment
  aptible ssh --app omar-staging bundle exec rails c
}

dev_stage() {
  # Dev environment - dev staging environment - not guaranteed to work
  aptible ssh --app omar-dev bundle exec rails c
}
