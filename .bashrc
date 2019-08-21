# Increase history size
HISTSIZE=10000
HISTFILESIZE=10000

# Ignore ls, ps, history in history
HISTIGNORE="ls:ps:history"

# Nodejs
export PATH=$HOME/.node/bin:$PATH
export NODE_PATH=$NODE_PATH:$HOME/.node/lib/node_modules


# Leiningen and other binaries
export PATH=$HOME/bin:$PATH

# Git

if [ -f ~/.git-completion ]; then
  source ~/.git-completion
fi

if [ -f ~/.git-prompt ]; then
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWUPSTREAM="auto"
  GIT_PS1_HIDE_IF_PWD_IGNORED=true

  source ~/.git-prompt

  export PS1='\[\e]0;\w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] $(__git_ps1 "[%s]") \$ '
  export PROMPT_DIRTRIM=2

fi

