# -- Terminal settings --------------------------
setopt PROMPT_SUBST
PROMPT=$'%1d%F{green}$(parse_git_branch)%f%F{normal}: '

# STARTUP: start in the right folder
DIRECTORY=$(pwd)
if [[ ${DIRECTORY} != *"src"* ]] ; then
  cd ~/src
fi

# Colors ls should use for folders, files, symlinks etc, see `man ls` and
# search for LSCOLORS
export LSCOLORS=GxFxCxDxBxegedabagaced

# Force ls to use colors (G) and use humanized file sizes (h) and show hidden files as well (a)
alias ls='ls -Gha'

# ensure grep doesn't use additional flags as that interferes with DSSH
export GREP_OPTIONS=''

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

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

# -- git settings -------------------------------
# Set default prompt, with git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Autocomplete for git:
autoload -Uz compinit && compinit

# -- Aliases --------------------------------------

# bundle exec turns into be
alias be="bundle exec"

# Ensures that Atom doesn't open several instances
alias code="open -a 'Visual Studio Code'"

# shortcut to src folder
alias home='cd ~/src'

# reload environment
alias reload='source ~/.zshrc'
