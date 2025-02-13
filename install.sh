#!/bin/bash

COMMAND_NAME="42clean"
SCRIPT_ALIAS="alias $COMMAND_NAME='/bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/BWG31/ShazamClean/refs/heads/main/ShazamClean.sh)\"'"

add_alias() {
	FILE_RC=$1
	if ! grep "$SCRIPT_ALIAS" $FILE_RC &> /dev/null; then
		echo "" >> $FILE_RC
		echo $SCRIPT_ALIAS >> $FILE_RC
		echo "Added $COMMAND_NAME alias to $FILE_RC"
	else
		echo "Alias already exists in $FILE_RC"
	fi
}

add_alias "$HOME/.zshrc"
add_alias "$HOME/.bashrc"
echo "Command available on shell restart: $COMMAND_NAME"
