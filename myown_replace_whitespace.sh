#!/bin/bash


file_type=""
user_input=""

function get_file_type {
	read user_input
	if [ -z $user_input ]; then
		file_type="*.*"
	else
		file_type=*.$user_input
	fi
}

function show_files {
	for i in $file_type; do
		if [ "$i" != "${i// /_}" ]; then
			echo -e "\t\t$i"
		fi
	done
}


function remove_whitespace {
	for i in $file_type; do
		if [ "$i" != "${i// /_}" ]; then
			mv "$i" "${i// /_}"
		fi
	done
}

function main {
	echo -e "\n\tHey.\n\tThis program will replace the spaces in the files passed to it with '_'.\n\tYou can stop at any point by pressing \e[34mctrl+c\e[0m.\n\tIf no file type is passed, all files in current folder will be renamed.\n"

	echo -en "\tPlease enter a file type: "
	get_file_type
	echo -e "\n\tThe following files will be changed:"
	show_files
	echo -e "\n\tTo continue and rename all these files press \e[34mEnter\e[0m.\n\tTo abort press \e[34mctrl+c\e[0m.\n\t\e[31mThese changes can NOT be undone!\e[0m"
	read DUMMY_INPUT
	remove_whitespace
	exit 0
}

main
