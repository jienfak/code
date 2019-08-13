#!/bin/sh
# Script for my execution menu.
. $SHMODS/chores/scriptdir.sh
rdir="`scriptdir`"
terminal="$WTERMINAL"
menupath="$rdir/path.sh"
fuzzer="fzf $@"
pipe="$TMP/launcher"
mkfifo "$pipe"
$terminal --title="   $0" --name=launcher -e "sh -c '$menupath | sort -u | $fuzzer > $pipe'" &
read command < $pipe
echo "$command"
rm $pipe
