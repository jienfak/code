#!/bin/sh

. $SHMODS/chores/hasprog.sh
progpref(){
	for prog in $@ ; do
		if hasprog "$prog" ; then
			echo "$(which $prog)"
			return 0
		fi
	done
	return 1
}
