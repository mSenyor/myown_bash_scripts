#!/bin/bash


hour="0"
minute="0"
second="0"

function prompt {
	printf "\n  Please use only positive integer at all times.\n  You can abort at any point by pressing 'ctrl+c'.\n"
}


function get_hour {
	printf "\n  How many \e[1m\e[4mhours\e[0m would you like to wait:\e[32m "
	read hour
	[[ $hour =~ ^-?[0-9]+$ ]] && printf "\e[0m  Hours set to: \e[32m$hour\e[0m\n" || get_hourx
}

function get_hourx {
	prompt
	get_hour
}


function get_minute {
	printf "\n  How many \e[1m\e[4mminutes\e[0m would you like to wait:\e[32m "
	read minute
	[[ $minute =~ ^-?[0-9]+$ ]] && printf "\e[0m  Minutes set to: \e[32m$minute\e[0m\n" || get_minutex
}

function get_minutex {
	prompt
	get_minute
}

function get_second {
	printf "\n  How many \e[1m\e[4mseconds\e[0m would you like to wait:\e[32m "
	read second
	[[ $second =~ ^-?[0-9]+$ ]] && printf "\e[0m  Seconds set to: \e[32m$second\e[0m\n" || get_secondx
}

function get_secondx {
	prompt
	get_second
}


function show_total {
	printf "\n  You've set the timer to:\n  ---------------------\n\t\e[32m$hour\e[0m\t  \e[1mhours\e[0m\n\t\e[32m$minute\e[0m\t  \e[1mminutes\e[0m\n\t\e[32m$second\e[0m\t  \e[1mseconds\e[0m\n\n  Press \e[34m'Enter'\e[0m to start the counter, or \e[34m'ctrl+c'\e[0m to abort.\n  (You could also abort with 'ctrl+c' at a later time)\n"
	read DUMMY_VARIABLE
}

total_sec="0"
function time_to_sec {
	hour_min=$[hour*60]
	total_min=$[hour_min+minute]
	min_sec=$[total_min*60]
	total_sec=$[min_sec+second]
}

#net_d="0"
net_h="0"
net_m="0"
net_s="0"
function sec_to_net {
	net_s=$[total_sec%60]
	rem=$[total_sec-net_s]
	rem=$[rem/60]
	net_m=$[rem%60]
	rem=$[rem-net_m]
	net_h=$[rem/60]
#	rem=$[rem/60]
#	net_h=$[rem%24]
#	rem=$[rem-net_h]
#	net_d=$[rem/24]
}
	
nice_time=""
cover_line=""
function set_nice_time {
	nice_time="There are \e[32m$net_s\e[0m \e[1mseconds\e[0m, \e[32m$net_m\e[0m  \e[1mminutes\e[0m, and \e[32m$net_h\e[0m  \e[1mhours\e[0m left."
	#nice_time="There are $net_s seconds, $net_m minutes, $net_h hours, and $net_d days left."

	cover_line="\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
}

function show_counter {
	while [ $total_sec -ge 1 ]
	do
		sec_to_net
		set_nice_time
		echo -ne "  $nice_time"
		sleep 1
		total_sec=$[$total_sec-1]
		echo -en $cover_line
	done
	echo
	echo -e "  \e[34m\e[1mDone!\e[0m"
	echo
}

function main {
	printf "\n  Hey.\n  To set the wait time you will be prompted for \e[1m\e[4mhours\e[0m, \e[1m\e[4mminutes\e[0m, and \e[1m\e[4mseconds\e[0m.\n  After the last prompt a counter will begin.\n  You can press \e[34m'ctrl+c'\e[0m to abort at any time.\n\e[0m"
	sleep 1

	get_hour
	get_minute
	get_second
	show_total
	time_to_sec

#sec_to_net
#printf "  Total amount of seconds: $total_sec\n"
#printf "  Which comes to:\n  $net_S\tseconds\n  $net_m\tminutes\n  $net_h\thours\n  $net_d\tdays\n"
	show_counter
	exit 0
}

main
exit 1
