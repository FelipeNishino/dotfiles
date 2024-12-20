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

. "$HOME/.cargo/env"

export EDITOR="nvim"
export VISUAL="nvim"
export USERVARS="$HOME/.config/user/.user-vars"
