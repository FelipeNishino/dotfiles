# garuda prompt theme

prompt_garuda_help() {
  cat <<'EOF'
This prompt is usable as-is, You can invoke it thus:

  prompt adam1 [ignored]

EOF
}

lambda='\u03BB'

garuda_prompt() {
    local hl='\u2500'
    local uc='\u250C'
    local bc='\u2514'
	echo -n "%F{blue}${uc}${hl}[ %n@%m ]${hl}${hl}[ %~ ]\n${bc}${hl}${hl}${lambda} "
}

garuda_rprompt() {
    echo -n "%(?.%F{green}λ.%F{red}λ %?)"
}

prompt_garuda_setup() {
    PS1=$(garuda_prompt)
    RPS1=$(garuda_rprompt)
    
    setopt transientrprompt
}

prompt_garuda_setup "$@"
