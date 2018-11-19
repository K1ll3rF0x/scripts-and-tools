## Readme

Add the scripts you want in your .bashrc. Move these files in your home directory. 
I usually hide these files to keep my home directory clean.


```bash
source ~/.git-completion
source ~/.git-prompt
```

Modify your prompt.
We'll use the colorized prompt based on the default Ubuntu prompt configuration + git-prompt function. The displayed branch name string length is also limited.

```bash
if [ -f ~/.git-completion ]; then
  source ~/.git-completion
fi

if [ -f ~/.git-prompt ]; then
  GIT_PS1_SHOWDIRTYSTATE=true # Show unstaged (*) and staged (+) changes next to the branch name
  GIT_PS1_SHOWSTASHSTATE=true # Show if something is stashed ($) next to the branch name
  GIT_PS1_SHOWUNTRACKEDFILES=true # Show if there are untracked files (%) next to the branch name
  GIT_PS1_SHOWUPSTREAM="auto" # Show difference between HEAD and its upstream. A "<" behind, ">" ahead, "<>"  diverged and "=" no difference. 
  GIT_PS1_HIDE_IF_PWD_IGNORED=true # Show nothing is directory is ignore by git

  source ~/.git-prompt
  # <terminal title from \e to \a> \e \w <path> \a \u <user> @ \h  <host> : \w <path> [<git-prompt output>] $
  export PS1='\[\e]0;\w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] $(__git_ps1 "[%s]") \$ '

  # Show part of the working directory path to preserve space in prompt.
  export PROMPT_DIRTRIM=2
fi
```

Alternatively, install ```sudo apt-get install git-core bash-completion``` and use ```source /usr/share/bash-completion/completions/git```


### Pretty log
Add this in your .gitconfig

```bash
[alias]
        prettylog = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all
        prettylog2 = log --all --decorate --oneline --graph
```
