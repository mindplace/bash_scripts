# -- Vars ---------------------------------------

export VAULT_CACERT=~/.openssl/betterment.cer
export VAULT_ADDR=https://vault.betterment.qa

# -- Fix for Java running out of memory ---------

# give the VM a semi-ridiculous amount of memory.
LOTS_O_MEM='-Xmx1024m -Xms256m -XX:MaxPermSize=128m'

# make JVM GC sweep permgen as well.
GC_PERMGEN='-XX:+CMSClassUnloadingEnabled -XX:+UseConcMarkSweepGC'

DO_DUMPS='-XX:+HeapDumpOnOutOfMemoryError'

# don't show the java dock icon. this breaks osx.gradle being able to auto-connect VPN.
NO_DOCK_ICON="-Djava.awt.headless=true"

export GRADLE_OPTS="$LOTS_O_MEM $GC_PERMGEN $NO_DOCK_ICON $DO_DUMPS"
export JAVA_OPTS="$LOTS_O_MEM $GC_PERMGEN $NO_DOCK_ICON $DO_DUMPS"
export CATALINA_OPTS="$LOTS_O_MEM $GC_PERMGEN $DO_DUMPS"

# -- Terminal, git settings ---------------------
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Colors ls should use for folders, files, symlinks etc, see `man ls` and
# search for LSCOLORS
export LSCOLORS=GxFxCxDxBxegedabagaced
# Force ls to use colors (G) and use humanized file sizes (h)
alias ls='ls -Gh'

# Force grep to always use the color option and show line numbers
export GREP_OPTIONS='--color=always'

# Set default prompt, with git branch
export PS1="\n\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\]: "

DIRECTORY=$(pwd)
# STARTUP: ON opening new window or tab: IF current directory is NOT within Programming, cd into Programming
if [[ ${DIRECTORY} != *"src"* ]] ; then
  cd ~/src/
fi

# autocomplete for git:
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# -- Managing Rbenv ----------------------------
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"

# Rbenv autocomplete and shims
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Path for RBENV
test -d "$HOME/.rbenv/" && PATH="$HOME/.rbenv/bin:$PATH"

# -- Homebrew, Heroku, Testtrack -----------------------------
# Path for Homebrew
test -d /usr/local/bin && export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

# Path for Heroku
test -d /usr/local/heroku/ && export PATH="/usr/local/heroku/bin:$PATH"

# Testtrack
[ -f ~/.bashrc ] && source ~/.bashrc

# -- Aliases --------------------------------------

# bundle exec turns into be
alias be="bundle exec"

# Ensures that Atom doesn't open several instances
alias atom="open -a /Applications/Atom.app/Contents/MacOS/Atom"

# shortcut for opening files and folders with macvim
# alias macvim='open -a macvim'

# shortcut to Programming folder
alias home='cd ~/src'

alias myrondo="RBENV_VERSION=$(cat $HOME/src/coach/rondo/.ruby-version) BUNDLE_GEMFILE=$HOME/src/coach/rondo/Gemfile bundle exec $HOME/src/coach/rondo/exe/rondo"
