build_prompt(){
	echo -n "%F{blue}╭─[ %n@arch ]──[ %~ ]\n╰──λ  \033[0m"
}

PROMPT=$(build_prompt)
RPROMPT='%(?.%F{green}λ.%F{red}λ %?)'
setopt transientrprompt
