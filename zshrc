# Profiling zsh start
# zmodload zsh/zprof

stty -ixon                                                      # disable ctrl-s and ctrl-q
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.shell/options
source ~/.shell/plugins
source ~/.shell/tools
source ~/.shell/bindings

autoload -Uz +X compinit
compinit; # new auto completions are not available
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit;
else
	compinit -C;
fi;

# Profiling zsh
# zprof
