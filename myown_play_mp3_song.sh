#!/bin/bash
song=$1

# checking if the file exist
function check_path {
	if [ -f "$song" ]; then
		check_type
	else
		echo -e "\t$song does not exist!"
		get_path
	fi
}


# taking path to file from user
function get_path {
	echo -en "\tPlease enter a path to an mp3 audio file: "
	read song
	echo
	check_path
}


# checking if the file type is mp3
function check_type {
	if [ "${song: -3}" == "mp3" ]; then
		echo -e "\n\tYou picked: $song"
	else
		echo -e "\t$song is not an mp3 audio file!"
		get_path
	fi
}


# checking if a file path was passed in the terminal
function check_arg {
	if [ -z "$song" ]; then
		get_path
	else
		check_path
	fi
}

########### everything after this line needs a rewrite because i hacked it too quickly while ignoring major issues ##########
function clean_xmms {
	echo blah
}

function play_song {
	xmms2 add $song
	xmms2 play
}
function main {
	check_arg
	play_song
	exit 0
}
main

