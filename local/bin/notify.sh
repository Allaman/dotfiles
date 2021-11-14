#!/bin/bash

function notify {
	if [[ -z "${DISPLAY// }" ]]
	then
		# no x server detected
		echo "$1"
	elif ! [[ -z "${DISPLAY// }" ]]
	then
		# x server detected
		notify-send "$1"
	else
		# error
		echo "Cannot check for running x server"
		exit 1
	fi
}
