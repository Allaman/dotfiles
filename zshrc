# Profiling zsh start
# zmodload zsh/zprof

stty -ixon -ixoff # disable ctrl-s and ctrl-q
bindkey -e # Emacs keybinding
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/.shell/options
source $HOME/.shell/plugins
source $HOME/.shell/tools
source $HOME/.shell/bindings

if [[ "$OSTYPE" =~ "darwin" ]]
then
  # when put in zshenv it gets overwritten by tmux which calls /etc/profile again (login shell)
  export PATH=$HOME/Library/Python/3.10/bin:/opt/homebrew/opt/gnu-tar/libexec/gnubin:/opt/homebrew/Cellar/coreutils/9.1/libexec/gnubin:/opt/homebrew/bin:/opt/homebrew/opt/mysql-client/bin:/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH

fi

autoload -Uz +X compinit

trap_exit_tmux ()
{
  # switch only when current session has only one window and one pane
  if [ $(tmux list-panes | wc -l) -eq 1 ] && [ $(tmux list-windows | wc -l) -eq 1 ]; then
    tmux switch-client -t 0
  fi
}

if [[ $- == *i* ]]
then
  # activate trap only when inside tmux so that I can open Terminals that don't trigger the trap
  if [[ $TERM_PROGRAM = "tmux" ]]
  then
    trap trap_exit_tmux EXIT
  fi
fi

# Profiling zsh
# zprof
