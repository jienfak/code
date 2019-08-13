#!/bin/sh

source $SHMODS/interactive/iaskyn
if iaskyn "Should I configure git as you want?" ; then
	if iaskyn "\tMaybe I can use protonmail and your OS-username that for?"; then
		git config --global  user.email $(whoami)@protonmail.com
		git config --global user.name $(whoami)
	fi
	echo "Nice, then enter your:";
	echo "Username:"; read name
	echo "E-mail:"; read email
	git config --global user.name $name
	git config --global user.email $email
fi
