[ -d $HOME/workspace/scripts ] && export PATH=$PATH:$HOME/workspace/scripts
[ -d $HOME/.local/bin ] && export PATH=$PATH:$HOME/.local/bin
[ -f $HOME/.aliases ] && source $HOME/.aliases
[ -f $HOME/.funcs ] && source $HOME/.funcs
[ -d ./shell/fzf-tab/ ] && source $HOME/.shell/fzf-tab/fzf-tab.plugin.zsh
