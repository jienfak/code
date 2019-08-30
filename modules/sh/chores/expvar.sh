expvar(){
	varfile="$HOME/.$1"
	if [ -f "$varfile" ] ; then
		export $1="`cat $varfile`"
	else
		export $1="$2"
	fi
}
