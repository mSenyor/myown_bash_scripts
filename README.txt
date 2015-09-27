This document will describ the functionality of the different scripts and will
hopefully be updated from time to time

all files names start with the string 'myown_' so i can easily find them when
i use them as shell commands.

myown_convert_mp4_2_mp3_and_DELETE.sh - uses 'ffmpeg' to convert mp4 video into an
mp3 audio file. then deletes the original mp4 file, and moves on to the next
mp4 file.

myown_convert_mp4_2_mp3_and_keep.sh - same as the former just keeps the
original file.

myown_play_mp3_song.sh - plays an mp3 file passed to it on terminal

myown_replace_whitespace.sh - takes a file type and replaces the space ' '
character in all files of that type inside current directory with '_'
character.

myown_set_sleep.sh - is a countdown script that prompts for hours, minutes,
and seconds, then uses the 'sleep' command to wait 1 second between each
count. it is probably not very accurate since it takes more than one second
for it to do one work cicle.

myown_stop_mp3_song.sh - used to stop the 'myown_play_mp3_song.sh' command.
should be combined into it then deleted.

myown_suspend_comp.sh - displays a warning for 5 seconds, then puts the
computer into standby mode.


