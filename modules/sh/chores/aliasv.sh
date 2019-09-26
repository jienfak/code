aliasv_zsh(){
	if [ "$ZSH_VERBOSE_MODE" = 'true' ] ; then
		print -P "alias: %F{yellow}'$1'%f=%F{red}'$2'%f"
	fi
	alias "$1"="$2"
}
