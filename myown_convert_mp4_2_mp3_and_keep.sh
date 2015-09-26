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
	done
}

function main {
	echo -e "\n\tHey.\n\tThis script will convert each \e[34mmp4\e[0m video in this folder into \e[34mmp3\e[0m audio file.\n\tIf you would like the original mp4 file to be \e[31mdeleted\e[0m when done with,\n\tuse \e[34mmyown_convert_mp4_2_mp3_and_DELETE.sh\e[0m script instead.\n\tTo continue press \e[34mEnter\e[0m, to quit press \e[34mctrl+c\e[0m."

	myown_get_none.sh
	echo -e "\n\tThe following files will be converted:"
	list_mp4
	echo -e "\n\tTo continue press \e[34mEnter\e[0m. To abort press \e[34mctrl+c\e[0m."
	myown_get_none.sh
	convert_mp4
}

main
