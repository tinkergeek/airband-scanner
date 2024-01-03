#!/bin/bash

while true
do
	change=$(inotifywait -e close_write --format '%f' "/storage/mp3" 2>/dev/null)
	echo `date` $change
	change=$(echo ${change} | sed 's/\.tmp//')
	/usr/bin/curl -4 -k -u user:password -T /storage/mp3/${change} -H "Title: Repeater Traffic" -H "Filename: /storage/mp3/${change}" https://ntfy.private.net/repeaters
done
