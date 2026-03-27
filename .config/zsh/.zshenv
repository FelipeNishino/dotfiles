pathdirs=('/usr/local/sbin')
pathdirs+=("$HOME/.local/bin")
pathdirs+=('/usr/local/opt/qt@5/bin')
pathdirs+=("$HOME/Library/Python/3.9/bin")

typeset -U path PATH

for dir in $pathdirs; do
  if [[ -z ${path[(r)$dir]} ]]; then
    path=($dir $path)
  fi 
done

source "$HOME/.config/user-dirs.dirs" 
export EDITOR="nvim"
export VISUAL="nvim"
export PRIMARY_MONITOR='DP-0'
export USERVARS="$HOME/.config/user/.user-vars"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export ANDROID_USER_HOME="$XDG_DATA_HOME"/android
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME"/docker-machine
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
# Elixir
export MIX_XDG="true"
export FFMPEG_DATADIR="$XDG_CONFIG_HOME"/ffmpeg
export GOPATH="$XDG_DATA_HOME"/go
export GOMODCACHE="$XDG_CACHE_HOME"/go/mod
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc":"$XDG_CONFIG_HOME/gtk-2.0/gtkrc.mine"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export MAVEN_OPTS=-Dmaven.repo.local="$XDG_DATA_HOME"/maven/repository
export MAVEN_ARGS="--settings $XDG_CONFIG_HOME/maven/settings.xml"
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export NVM_DIR="$XDG_DATA_HOME"/nvm 
export PHP_HISTFILE="$XDG_STATE_HOME"/php/history
export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
export PSQL_HISTORY="$XDG_STATE_HOME/psql_history"
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"
export PYENV_ROOT=$XDG_DATA_HOME/pyenv
export PYTHON_HISTORY=$XDG_STATE_HOME/python_history
export PYTHONPYCACHEPREFIX=$XDG_CACHE_HOME/python
export PYTHONUSERBASE=$XDG_DATA_HOME/python
export RENPY_PATH_TO_SAVES="$XDG_DATA_HOME/renpy"
export RENPY_MULTIPERSISTENT="$XDG_DATA_HOME/renpy_shared"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export SQLITE_HISTORY=$XDG_STATE_HOME/sqlite_history

export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config

export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default

# export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export ERRFILE="$XDG_CACHE_HOME"/X11/xsession-errors
#export XCURSOR_PATH=/usr/share/icons:$XDG_DATA_HOME/icons
export XCURSOR_PATH=${XCURSOR_PATH}:$XDG_DATA_HOME/icons
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc
