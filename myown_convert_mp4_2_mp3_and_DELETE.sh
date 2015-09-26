#!/bin/bash
#list_stuff

_curr_name=""
_new_name=""

function new_name {
	_len=${#_curr_name}
	_new_name="${_curr_name:0:$[len-4]}.mp3"
}

function list_mp4 {
	for i in *.mp4; do
		echo -e "\t\t$i"
	done
}


function convert_mp4 {
	for i in *mp4; do
		_curr_name="$i"
		new_name
		ffmpeg -i "$_curr_name" -vn -acodec libmp3lame -ac 2 -qscale:a 4 -ar 48000 "$_new_name"
		if [ -f "$_new_name" ]; then
			rm -f "$_curr_name"
			echo -e "\e[1m\e[34m$_new_name \e[32msuccessfully created. \n\e[33mRemoving original: \e[34m$_curr_name\n\e[0m"
		else
			echo -e "\e[1m\e[31mFailed to create: \e[34m$_new_name.\n\e[33mKeeping original file: \e[34m$_curr_name\n\e[0m"
		fi
	done
}

function main {
	echo -e "\n\tHey.\n\tThis script will convert each \e[34mmp4\e[0m video in this folder into \e[34mmp3\e[0m audio file.\n\tAt the end of each conversion, the original mp4 video will be \e[31mdeleted\e[0m.\n\tTo continue press \e[34mEnter\e[0m, to quit press \e[34mctrl+c\e[0m."

	myown_get_none.sh
	echo -e "\n\tThe following files will be converted:"
	list_mp4
	echo -e "\n\tTo continue press \e[34mEnter\e[0m. To abort press \e[34mctrl+c\e[0m.\n\t\e[31mWARNING: each file will be deleted after conversion!\e[0m"
	myown_get_none.sh
	convert_mp4
}

main
