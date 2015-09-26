#!/bin/bash
function new_dir {
	sleep 1
	_now=$(date '+%Y%m%d%H%M%S')
	#echo $_now
	mkdir $_now
}
function list_stuff {
	echo ---------
	for i in $( ls ); do
		echo xxxxx
		echo ${i// /_}
	done
	echo ---------
}
#list_stuff
#new_dir
#list_stuff

_curr_name=""
_new_name=""

function new_name {
	_len=${#_curr_name}
	_new_name="${_curr_name:0:$[len-4]}.mp3"
}

function list_mp4 {
	for i in *.mp4; do
		echo $i
	done
}

function no_whitespace {
	for i in *.mp4; do
		if [ "$i" != "${i// /_}" ]; then
			mv "$i" "${i// /_}"
		fi
	done
}
no_whitespace
list_mp4

function convert_mp4 {
	for i in *mp4; do
		_curr_name="$i"
		new_name
		ffmpeg -i "$_curr_name" -vn -acodec libmp3lame -ac 2 -qscale:a 4 -ar 48000 "$_new_name"
		[ -f "blah.mp3" ] && rm -f "$_curr_name" | echo -e "\e[1m\e[34m$_new_name \e[32msuccessfully created. \n\e[33mRemoving: \e[34m$_curr_name\n\e[0m" || echo -e "\e[1m\e[31mFailed to create \e[34m$_new_name.\n\e[33mKeeping: \e[34m$_curr_name\n\e[0m"
		sleep 1
	done
}

convert_mp4
