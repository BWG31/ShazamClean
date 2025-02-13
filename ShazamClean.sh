#!/bin/bash

INPUT_FILE="$HOME/.config/ShazamClean/cleaning_list.txt"

GREEN="\033[0;92m"
YELLOW="\033[0;93m"
CYAN="\033[0;96m"
BOLD_RED="\033[1;91m"
BOLD_GREEN="\033[1;92m"
BOLD_YELLOW="\033[1;93m"
RESET="\033[0m"
BOLD="\033[1m"
UNDERLINE="\033[4m"
ITALIC_WHITE="\033[3;0m"
ITALIC_YELLOW="\033[3;93m"

abort(){
	echo -e $BOLD_RED"ABORTED"$RESET
	exit 1
}

log_size(){
	if [ "$#" -ne 2 ]; then
		echo "Error: log_size expected 2 arguments: got $#: aborting" >&2
		abort
	fi
	local dir_name=$1
	local dir_size=$2
	echo -e "$dir_size\t\t$dir_name"
}

delete_directory_contents(){
	if [ "$#" -ne 1 ]; then
		echo "Error: delete_directory_contents expected 1 argument: got $#: aborting" >&2
		abort
	fi
	local dir=$1
	rm -rf "$dir"/* "$dir"/.* 2>/dev/null
}

process_directory(){
	if [ "$#" -ne 1 ]; then
		echo "Error: process_directory expected 1 argument: got $#: aborting" >&2
		abort
	fi
	local dir="$HOME/$1"
	local size
	if [ ! -d "$dir" ]; then
		size="Noexist"
	else
		size=$(du -sh "$dir" | awk '{print $1}')
		delete_directory_contents "$dir"
	fi
	log_size "$dir" "$size"
}

process_directories_from_file(){
	if [ "$#" -ne 1 ]; then
		echo "Error: process_directories_from_file expected 1 argument: got $#: aborting" >&2
		abort
	fi
	local file=$1
	if [ ! -f "$file" ] || [ ! -r "$file" ]; then
		echo "Error: input file "$file" does not exist or cannot be read: aborting" >&2
		abort
	fi
	echo -e $UNDERLINE"CLEARED\t\tDIRECTORY"$RESET
	while IFS= read -r dir || [ -n "$dir" ]; do
		if [ -z "$dir" ]; then
			continue
		fi
		process_directory "$dir"
		sleep 0.01
	done < "$file"
}

display_space(){
	df -h | grep $USER | awk '{print $4}'
}

ensure_config() {
	if [ ! -f "$INPUT_FILE" ] ; then
		echo -e $CYAN"Coping default config list: $INPUT_FILE"$RESET
		mkdir -p $(dirname "$INPUT_FILE")
		curl -fsSL https://raw.githubusercontent.com/BWG31/ShazamClean/refs/heads/main/cleaning_list.txt > "$INPUT_FILE"
	fi
}

main() {
	ensure_config
	echo -e $YELLOW"Cleaning..."$RESET
	sleep 0.5
	SPACE_BEFORE=$(display_space)
	echo "=============================="
	process_directories_from_file "$INPUT_FILE"
	echo "=============================="
	echo -e $GREEN"Clean complete!"$RESET
	sleep 0.5
	echo "=============================="
	echo -e $BOLD"Total home size:\t" $(df -h | grep $USER | awk '{print $2}') $RESET
	echo -e $BOLD_RED"Free space before:\t" $SPACE_BEFORE $RESET
	echo -e $BOLD_GREEN"Free space after:\t" $(display_space) $RESET
	echo "=============================="
	echo -e $CYAN"Edit cleaning list here: $INPUT_FILE" $RESET
	echo -e $ITALIC_YELLOW "by Shazam ⚡︎bgolding (42Lausanne)" $RESET
}

main
