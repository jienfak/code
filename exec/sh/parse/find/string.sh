#!/bin/sh
# Simple script to find string in files.

. "$SHMODS/chores/loseall.sh"
usage(){
	echo "$0: usage: [string] [files]"
	exit 1
}

[ "$#" -le 2 ] && usage

string="$1"
shift
start_files="$@"

files=""
for file in $start_files ; do
	if [ -d $file ] ; then
		files="$files `find $file -type f`"
	else
		files="$files $file"
	fi
done

for file in $files ; do
	echo "$file:"
	cat "$file" | grep -in "$string"
done
