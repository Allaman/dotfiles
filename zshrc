# Profiling zsh start
# zmodload zsh/zprof

stty -ixon                                                      # disable ctrl-s and ctrl-q
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

## Options section
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.
setopt histappend
setopt inc_append_history
setopt share_history

# case insensitive autocompletion
zstyle ":completion:*" matcher-list "" "m:{a-z}={A-Z}" "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=* l:|=*"
zstyle ':completion:*' hosts off                                # ignore hosts file for ssh/scp autocompletion
## Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
HISTFILE=~/.zhistory
HISTSIZE=50000
SAVEHIST=50000
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word


# Theming section
autoload -U compinit colors zcalc
zmodload zsh/complist
zstyle ':completion:*' menu select                              # to activate the menu, press tab twice
unsetopt menu_complete                                          # do not autoselect the first completion entry
unsetopt nomatch                                                # allow gloobing, e.g apt update kernel*
setopt complete_aliases                                         # autocompletion CLI switches for aliases
zstyle ':completion:*' list-colors ''                           # show colors on menu completion
compinit -d
colors

## Keybindings section
bindkey -e # emacs style
bindkey "^[[3~" delete-char                                  # Delete key
bindkey '^[[2~' overwrite-mode                               # Insert key
bindkey "^[[H"  beginning-of-line                            # Home
bindkey "^[[F"  end-of-line                                  # End
bindkey '^P' history-beginning-search-backward               # CTRL+p
bindkey '^N' history-beginning-search-forward                # CTRL+n
# Use vim keys to select autocompletion
_comp_options+=(globdots)		# Include hidden files.
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
# edit command in editor
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# source zsh
[ -f $HOME/.shell/zshenv ] && source $HOME/.shell/zshenv
[ -f $HOME/.profile ] && source $HOME/.profile
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
[ -f $HOME/.fzf/shell/key-bindings.zsh ] && source $HOME/.fzf/shell/key-bindings.zsh
[ -f $HOME/.shell/fzf-tab/fzf-tab.plugin.zsh ] && source $HOME/.shell/fzf-tab/fzf-tab.plugin.zsh
[ -d $HOME/.shell/fast-syntax-Highlighting ] && source $HOME/.shell/fast-syntax-Highlighting/fast-syntax-highlighting.plugin.zsh
[ -f $HOME/.shell/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source  $HOME/.shell/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f $HOME/.shell/zsh-history-substring-search/zsh-history-substring-search.zsh ] && source $HOME/.shell/zsh-history-substring-search/zsh-history-substring-search.zsh
[ -d $HOME/.shell/zsh-completions/ ] &&  fpath=($HOME/.shell/zsh-completions/src $fpath)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f $HOME/.shell/powerlevel10k/powerlevel10k.zsh-theme ] && source $HOME/.shell/powerlevel10k/powerlevel10k.zsh-theme

# source apps
export _ZO_FZF_OPTS="$_FZF_DEFAULT_OPTS --select-1 --exit-0 --height=25% --reverse --no-sort --cycle"
export _ZO_DATA_DIR=$HOME/.zoxide
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh)"
command -v fuck > /dev/null 2>&1 && eval "$(thefuck --alias)"
command -v direnv > /dev/null 2>&1 && eval "$(direnv hook zsh)"
[ -d $HOME/.shell/forgit ] && source $HOME/.shell/forgit/forgit.plugin.zsh
[ -d $HOME/.shell/kube-fzf ] && export PATH=$PATH:$HOME/.shell/kube-fzf/
[ -d $HOME/.local/sdkman/ ] && export SDKMAN_DIR="$HOME/.local/sdkman" && source $HOME/.local/sdkman/bin/sdkman-init.sh
[ -d $HOME/.config/broot/launcher/bash/br ] && source $HOME/.config/broot/launcher/bash/br

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
bindkey '^ ' autosuggest-accept                                 # zsh autosuggestions completion

# Change autosuggestion color see https://coderwall.com/p/pb1uzq/z-shell-colors
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=060'

enable-fzf-tab

autoload bashcompinit
bashcompinit
export PATH="$PATH:$HOME/.bash-my-aws/bin"
[ -f $HOME/.bash-my-aws/aliases ] && source ~/.bash-my-aws/aliases
[ -f $HOME/.bash-my-aws/bash_completion.sh ] && source ~/.bash-my-aws/bash_completion.sh

autoload -Uz +X compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit;
else
	compinit -C;
fi;

# Profiling zsh
# zprof
