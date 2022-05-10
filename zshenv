# This file is sourced by all instances of Zsh and I want
# this config to be always available

command -v vim >/dev/null 2>&1 && export EDITOR=vim
command -v nvim >/dev/null 2>&1 && export EDITOR=nvim

[ -d $HOME/workspace/git.rootknecht.net/scripts ] && export PATH=$PATH:$HOME/workspace/git.rootknecht.net/scripts
[ -d $HOME/.local/bin ] && export PATH=$PATH:$HOME/.local/bin
[ -f $HOME/.shell/aliases ] && source $HOME/.shell/aliases
[ -f $HOME/.shell/funcs ] && source $HOME/.shell/funcs

# NNN
export NNN_OPTS=aidRU
export NNN_TRASH=1 # trash-cli
export NNN_PLUG='t:autojump;d:diffs;p:preview-tui'
export NNN_FIFO=/tmp/nnn.fifo
export SPLIT='v' # for vertical kitty splits

# Colored man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r

export LEDGER_DIR=$HOME/data/obsidian/privat/ledger/
export LEDGER_FILE=${LEDGER_DIR}main.ledger

export EXCLUDE_STRING=.git/*,node_modules/*,target/*,.idea/*,.vscode/*,.terraform/*,.gem/*,.cache,**/cache/*,**go/pkg/*,lib/*,bin/*,include/*

# fzf
# WARNING: fd is filtered by ~/.fdignore!
export FZF_COMPLETION_TRIGGER=',,'
# Use fd (https://github.com/sharkdp/fd) instead of the default find
# The first argument to the function ($1) is the base path to start traversal
_fzf_compgen_path() {
  fd --hidden --follow . "$1"
}
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow . "$1"
}
# add support for ctrl+o to open selected file
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute:nvim {} > /dev/tty'"
# Preview files
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
# Preview directories with tree
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
command -v fd >/dev/null 2>&1 && export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden'
command -v fd >/dev/null 2>&1 && export FZF_ALT_C_COMMAND='fd --type directory --follow --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

if [[ "$OSTYPE" =~ "darwin" ]]
then
  export PATH=$HOME/Library/Python/3.8/bin:/opt/homebrew/opt/gnu-tar/libexec/gnubin/:/opt/homebrew/Cellar/coreutils/9.0/libexec/gnubin:/opt/homebrew/bin:$PATH
  export LC_CTYPE=UTF-8
  if [[ x"$KITTY_PID" == "x" ]]
  then # not kitty
    export TERMINAL=xterm
    export TERM=xterm-256color
  else
    export TERMINAL=kitty
    export TERM=xterm-kitty
  fi
  alias ssh='kitty +kitten ssh'
  export BROWSER="open -a firefox"
  export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
fi

if [[ "$OSTYPE" =~ "linux" ]]
then
  if [[ "$DESKTOP_SESSION" =~ "xfce" ]];then
      eval $(gnome-keyring-daemon --start)
      export SSH_AUTH_SOCK
  fi
  export TERM=screen-256color
  export TERMINAL=alacritty
  export BROWSER=firefox
  export BROWSERCLI=lynx
  export MAIL=/usr/bin/neomutt
  # KDE SSH keys
  [ -S /run/user/1000/ssh-agent.socket ] && export SSH_AUTH_SOCK=/run/user/1000/ssh-agent.socket
  [ -f /usr/bin/ksshaskpass ] && export SSH_ASKPASS=/usr/bin/ksshaskpass

  # basedir defaults, in case they're not already set up.
  # http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
  if [[ -z "$XDG_DATA_HOME" ]]; then
    export XDG_DATA_HOME="$HOME/.local/share"
  fi

  if [[ -z "$XDG_CONFIG_HOME" ]]; then
    export XDG_CONFIG_HOME="$HOME/.config"
  fi

  if [[ -z "$XDG_CACHE_HOME" ]]; then
    export XDG_CACHE_HOME="$HOME/.cache"
  fi

  if [[ -z "$XDG_DATA_DIRS" ]]; then
    export XDG_DATA_DIRS="/usr/local/share:/usr/share"
  fi

  if [[ -z "$XDG_CONFIG_DIRS" ]]; then
    export XDG_CONFIG_DIRS="/etc/xdg"
  else
    export XDG_CONFIG_DIRS="/etc/xdg:$XDG_CONFIG_DIRS"
  fi
fi

export LF_ICONS="\
di=🗀 :\
fi=🗎:\
ln=:\
or=:\
ex=:\
*.vimrc=:\
*.viminfo=:\
*.gitignore=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.pdf=:\
*.nix=:\
"
