#!/bin/bash

echo Hi $USER checking blockify

if pgrep -x "blockify-ui" > /dev/null
	then
	echo blockify is running,exiting;
	exit
else
	echo Checking if Spotify is running
	if pgrep -x "spotify" > /dev/null
		then
		echo Spotify is running, starting blockify
		blockify-ui & sleep 2 && exit
	else
		echo Spotify is not running
		echo Starting Spotify minimized
		spotify >/dev/null 2>&1 & sleep 4 && xdotool search --sync --onlyvisible --class "spotify" windowminimize
		echo Starting blockify
		blockify-ui -q & sleep 2 && exit
	fi
fi
