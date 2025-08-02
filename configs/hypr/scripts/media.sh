#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Usage: $0 --title | --arturl | --info"
	exit 1
fi

# Function to get metadata using playerctl
get_metadata() {
	key=$1
	playerctl metadata --format "{{ $key }}" 2>/dev/null
}

# Parse the argument
case "$1" in
--title)
	title=$(get_metadata "xesam:title")
	if [ -z "$title" ]; then
		echo ""
	else
		echo "${title:0:30}"
	fi
	;;
--arturl)
	url=$(get_metadata "mpris:artUrl")
	if [ -z "$url" ]; then
		echo ""
	else
        curl --silent "$url" --output /tmp/art.jpg
		if [ -f /tmp/art.jpg ]; then
            echo "/tmp/art.jpg"
        else
            echo "~/.config/images/default_art.png"
        fi
	fi
	;;
--info)
    artist=$(playerctl metadata --format "{{ xesam:artist }}" 2>/dev/null)
	album=$(playerctl metadata --format "{{ xesam:album }}" 2>/dev/null)
	if [[ -n $artist && -n $album ]]; then
		echo "$album - $artist"
	elif [[ -n $album ]]; then
		echo "$album"
	elif [[ -n $title ]]; then
        echo "$title"
    else
		echo ""
	fi
	;;
*)
	echo "Invalid option: $1"
	echo "Usage: $0 --title | --arturl | --info"
	exit 1
	;;
esac