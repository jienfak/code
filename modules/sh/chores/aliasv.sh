aliasv_zsh(){
	print -P "alias: %F{yellow}'$1'%f=%F{red}'$2'%f"
	alias "$1"="$2"
}
