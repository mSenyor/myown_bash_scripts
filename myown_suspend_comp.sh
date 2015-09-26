#!/bin/bash

counter=5

function warn_and_wait {

	while [ $counter -ge 1 ]
	do
		echo -ne "\t\e[31m\e[5m\e[1mWARNING!\e[0m system will go into standby in \e[31m\e[1m$counter\e[0m seconds. (Press \e[34mctrl+c\e[0m to abort)"
		counter=$[$counter-1]
		sleep 1
		echo -ne "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
	done
	echo -ne "\t\e[31m\e[5m\e[1mWARNING!\e[0m system will go into standby in \e[31m\e[1m$counter\e[0m seconds.                           \n\tGoing into standby mode..."	

	echo
	echo -e "\t\e[32m\e[1mGOODBYE!\e[0m\n"
}

function main {
	warn_and_wait
	dbus-send --system --print-reply --dest="org.freedesktop.UPower" /org/freedesktop/UPower org.freedesktop.UPower.Suspend
	exit 0
}

main
