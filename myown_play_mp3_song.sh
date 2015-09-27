#!/bin/bash
song=$1

# checking if the file exist
function check_path {
	if [ -f "$song" ]; then
		check_type
	else
		echo -e "\t$song does \e[31mnot\e[0m exist!\n"
		get_none.sh
		get_path
	fi
}


# taking path to file from user
function get_path {
	echo -en "\tPlease enter a path to an mp3 audio file: "
	read song
	check_path
}


# checking if the file type is mp3
function check_type {
	if [ "${song: -3}" == "mp3" ]; then
		echo -e "\n\tYou picked: \e[34m$song\e[0m\n"
	else
		echo -e "\t$song is \e[31mnot\e[0m an mp3 audio file!\n"
		get_none.sh
		get_path
	fi
}


# checking if a file path was passed in the terminal
function check_arg {
	if [ -z "$song" ]; then
		echo -e "\n\tHey."
		get_path
	else
		case $song in
			"--stop")
				xmms2 stop
				exit 0
				;;
			*)
				echo -e "\n\tHey."
				check_path
				;;
		esac
	fi
}

########### everything after this line needs a rewrite because i hacked it too quickly while ignoring major issues ##########
function clean_xmms {
	echo blah
}

function play_song {
	clean
	xmms2 add $song
	xmms2 play
	exit 0
}

function clean {
	echo -e "\tThe following playlist will be cleaned:\n"
	xmms2 list
	get_none.sh
	for i in $( xmms2 list | grep " - " | cut -c 9- | tr ' ' '_'); do
		xmms2 remove 1
	done
}

function main {
	check_arg
	play_song
	exit 0
}
main
exit 1
