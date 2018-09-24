## Readme

Add the scripts you want in your .bashrc. Move these files in your home directory. 
I usually hide these files to keep my home directory clean.

```bash
source ~/.git-completion
source ~/.git-prompt

export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] $(__git_ps1 "[%s] ")\$ '
```


### Pretty log
Add this in your .gitconfig

```bash
[alias]
        prettylog = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all
        prettylog2 = log --all --decorate --oneline --graph
```
