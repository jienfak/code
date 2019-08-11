#!/bin/sh
. $SHMODS/chores/scriptdir.sh

rdir=`scriptdir`
menupath="$rdir/get.sh"
torun="$menupath -i --border --prompt=':'  --cycle"

out="`$torun`"
if [ ! -z "$out" ] ; then
	exec $out &
fi
