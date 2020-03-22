# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r

# Apps and Paths
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
if [ "$0" = "/etc/lightdm/Xsession" -a "$DESKTOP_SESSION" = "i3" ]; then
  export $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gnupg)
fi
export BROWSERCLI=lynx
export BROWER=firefox
export TERMINAL=termite
export TERM=rxvt-unicode-256color
export EDITOR=vim
export MAIL=/usr/bin/neomutt
[ -f /usr/bin/ksshaskpass ] && export SSH_ASKPASS=/usr/bin/ksshaskpass
[ -f /usr/lib/ssh/ksshaskpass ] && export SSH_ASKPASS=/usr/lib/ssh/ksshaskpass
export LEDGER_FILE=$HOME/data/buchhaltung/ledger/main.ledger
command -v yay >/dev/null 2>&1 && export AUR_MANAGER=yay
command -v go >/dev/null 2>&1 && export PATH=$PATH:$(go env GOPATH)/bin && export GOPATH=$HOME/workspace/go
command -v rustc >/dev/null 2>&1 && export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src" && export PATH=$PATH:~/.cargo/bin


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

# python
export WORKON_HOME=$HOME/.virtualenvs
VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
[ -f /usr/bin/virtualenvwrapper.sh ] && source /usr/bin/virtualenvwrapper.sh

# fzf
export FZF_COMPLETION_TRIGGER=',,'
# add support for ctrl+o to open selected file in sublime text
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute:vim {} > /dev/tty'"
# Preview files
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
# Preview directories with tree
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
command -v rg >/dev/null 2>&1 && export FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore-vcs --glob "!{node_modules/*,.git/*}"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
