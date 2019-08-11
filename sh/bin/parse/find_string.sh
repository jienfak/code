#!/bin/sh
# Simple script to find string in files.

. "$SHMODS/chores/loseall.sh"
usage(){
	echo "$0: usage: [string] [files]"
	exit 1
}

if [ "$#" -le 2 ] ; then
	usage
fi

string="$1"
shift
files="$@"

for file in $files ; do
	echo "$file:"
	cat "$file" | grep -in "$string"
done
