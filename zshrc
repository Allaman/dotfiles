# Profiling zsh start
# zmodload zsh/zprof

stty -ixon # disable ctrl-s and ctrl-q
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

autoload -Uz +X compinit

# Profiling zsh
# zprof
