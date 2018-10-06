# General Configuration

1. Use [prezto](https://github.com/sorin-ionescu/prezto) to configure
   zsh.
   1. Add the block below to the .zshrc file.
1. Use [janus](https://github.com/carlhuda/janus) to configure vim
1. Run `./install.sh`


```
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
export KEYTIMEOUT=1
```
