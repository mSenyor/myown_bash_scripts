#!/bin/bash
app=$1

if [ "${app: -3}" == "apk" ]; then
	adb install $app
else
	echo "No apk file provided"
fi
