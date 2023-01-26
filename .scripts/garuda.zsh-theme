hl='\u2500'
uc='\u250C'
bc='\u2514'
lambda='\u03BB'
build_prompt(){
	echo -n "%F{blue}${uc}${hl}[ %n@%m ]${hl}${hl}[ %~ ]\n${bc}${hl}${hl}${lambda} "
}

PROMPT=$(build_prompt)
RPROMPT='%(?.%F{green}λ.%F{red}λ %?)'
setopt transientrprompt
