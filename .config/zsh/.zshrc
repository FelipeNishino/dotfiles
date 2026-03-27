# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Variables
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
ANTDIR="$ZDOTDIR/.antidote"

# History config
HISTFILE="$XDG_STATE_HOME"/zsh/.zsh_history
HISTSIZE=50000
SAVEHIST=10000

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"

# User variables
ZSH_ALIASES_DIR="$ZDOTDIR/aliases"
ZSH_PROMPTS_DIR="$ZDOTDIR/prompts"
ZSH_THEMES_DIR="$ZDOTDIR/themes"

#"-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Options
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
setopt promptsubst
unsetopt autocd beep
setopt nobanghist

# Use emacs keybindings
bindkey -e

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Compinstall
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
zstyle :compinstall filename '$HOME/.config/zsh/.zshrc'

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION" 

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Prompt
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
fpath=("$ZSH_PROMPTS_DIR" "$fpath[@]")

autoload -Uz promptinit
promptinit

prompt garuda

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Antidote
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
source $ANTDIR/antidote.zsh
antidote load

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Tools
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Load nvm
source /usr/share/nvm/init-nvm.sh

# Color and keybindings not used because of omz libs 

## enable color support of ls and also add handy aliases
#  if [ -x /usr/bin/dircolors ]; then
#      test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#      alias ls='ls --color=auto'
#      alias dir='dir --color=auto'
#      alias vdir='vdir --color=auto'
#      alias grep='grep --color=auto'
#      alias fgrep='fgrep --color=auto'
#      alias egrep='egrep --color=auto'
#  fi
#
## some more ls aliases
#alias ll='ls -alF'
#alias la='ls -A'
#alias l='ls -CF' 

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Keybindings
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
#typeset -g -A key
#
#key[Home]="${terminfo[khome]}"
#key[End]="${terminfo[kend]}"
#key[Insert]="${terminfo[kich1]}"
#key[Backspace]="${terminfo[kbs]}"
#key[Delete]="${terminfo[kdch1]}"
#key[Up]="${terminfo[kcuu1]}"
#key[Down]="${terminfo[kcud1]}"
#key[Left]="${terminfo[kcub1]}"
#key[Right]="${terminfo[kcuf1]}"
#key[PageUp]="${terminfo[kpp]}"
#key[PageDown]="${terminfo[knp]}"
#key[Shift-Tab]="${terminfo[kcbt]}"
#
## setup key accordingly
#[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
#[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
#[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
#[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
#[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
#[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
#[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
#[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
#[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
#[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
#[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
#[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete
#
## Finally, make sure the terminal is in application mode, when zle is
## active. Only then are the values from $terminfo valid.
#if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
#	autoload -Uz add-zle-hook-widget
#	function zle_application_mode_start { echoti smkx }
#	function zle_application_mode_stop { echoti rmkx }
#	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
#	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
#fi

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Fixes
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# https://github.com/zsh-users/zsh-autosuggestions/issues/747#issuecomment-2381387063
# Fix invalid suggestion when using completions
menu-select-wrap() {
zle menu-select
}
zle -N menu-select-wrap

bindkey              '^I' menu-select-wrap
bindkey "$terminfo[kcbt]" menu-select-wrap
bindkey -M menuselect              '^I'         menu-complete
bindkey -M menuselect "$terminfo[kcbt]" reverse-menu-complete

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Aliases
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

source "$ZSH_ALIASES_DIR/common.alias"
source "$ZSH_ALIASES_DIR/$(hostname).alias"

