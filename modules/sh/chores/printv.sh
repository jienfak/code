printv_zsh(){
	if [ "$ZSH_VERBOSE_MODE" = 'true' ] ; then
		print $@
	fi
}
