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

export LEDGER_FILE=$HOME/data/buchhaltung/ledger/main.ledger
command -v go >/dev/null 2>&1 && export GOPATH=$HOME/.local/share/go && export PATH=$PATH:$(go env GOPATH)/bin
command -v dyff > /dev/null 2>&1 && export KUBECTL_EXTERNAL_DIFF="dyff between --omit-header --set-exit-code"

# macons only
if [[ "$OSTYPE" =~ "darwin" ]]
then
  if [[ x"$KITTY_PID" == "x" ]]
  then
    export TERMINAL=xterm
    export TERM=xterm
  else
    export TERMINAL=kitty
    export TERM=xterm-kitty
  fi
  alias ssh='kitty +kitten ssh'
  export BROWSER="open -a firefox"
  export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
fi

export EXCLUDE_STRING=.git,node_modules/*,**/.git/*,.git/*,target/*,.idea/*,.vscode/*,.terraform/*,.gem/*,.cache,**/cache/*,**go/pkg/*

# fzf
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
#command -v rg >/dev/null 2>&1 && export FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore-vcs --glob "!{$EXCLUDE_STRING}"'
command -v fd >/dev/null 2>&1 && export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden'
command -v fd >/dev/null 2>&1 && export FZF_ALT_C_COMMAND='fd --type directory --follow --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# linux only
if [[ "$OSTYPE" =~ "linux" ]]
then
  export TERM=screen-256color
  export TERMINAL=alacritty
  export BROWSER=firefox
  export BROWSERCLI=lynx
export MAIL=/usr/bin/neomutt
  # Apps and Paths
  export QT_QPA_PLATFORMTHEME="qt5ct"
  export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
  command -v paru >/dev/null 2>&1 && export AUR_MANAGER=paru
  command -v rustc >/dev/null 2>&1 && export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src" && export PATH=$PATH:~/.cargo/bin
  # i3wm SSH keys
  if [ "$0" = "/etc/lightdm/Xsession" -a "$DESKTOP_SESSION" = "i3" ]; then
    export $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gnupg)
  fi
  # KDE SSH keys
  [ -S /run/user/1000/ssh-agent.socket ] && export SSH_AUTH_SOCK=/run/user/1000/ssh-agent.socket
  [ -f /usr/bin/ksshaskpass ] && export SSH_ASKPASS=/usr/bin/ksshaskpass
  [ -f /usr/bin/ksshaskpass ] && export GIT_ASKPASS=/usr/bin/ksshaskpass
  # ruby gem
  export PATH=$PATH:~/.gem/ruby/2.7.0/bin
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

# vim: ft=sh
