#!/bin/bash

# Define variables
INSTALL_DIR="$HOME/.config/ShazamClean"
COMMAND_SCRIPT="ShazamClean.sh"
COMMAND_NAME="42clean"
CLEANING_LIST="cleaning_list.txt"
UNINSTALL_FILE="uninstall.sh"
ZSHRC="$HOME/.zshrc"
BASHRC="$HOME/.bashrc"
SCRIPT_ALIAS="alias $COMMAND_NAME=\"$INSTALL_DIR/$COMMAND_SCRIPT\""

mkdir -p "$INSTALL_DIR"

if [ -e "$COMMAND_SCRIPT" ] && [ -e "$CLEANING_LIST" ]; then
	echo "Creating executable command..."
	cp "$COMMAND_SCRIPT" "$INSTALL_DIR/"	
	cp "$CLEANING_LIST" "$INSTALL_DIR/"
	cp "$UNINSTALL_FILE" "$INSTALL_DIR/"
	chmod +x "$INSTALL_DIR/$COMMAND_SCRIPT"
else
	echo "One of the required files is missing. Aborting install."
	exit 1
fi

if ! grep "$SCRIPT_ALIAS" $ZSHRC &> /dev/null; then
	echo "" >> $ZSHRC
	echo $SCRIPT_ALIAS >> $ZSHRC
	echo "Added $COMMAND_NAME alias to $ZSHRC"
else
	echo "Alias already exists in $ZSHRC"
fi

if ! grep "$SCRIPT_ALIAS" $BASHRC &> /dev/null; then
	echo "" >> $BASHRC
	echo $SCRIPT_ALIAS >> $BASHRC
	echo "Added $COMMAND_NAME alias to $BASHRC"
else
	echo "Alias already exists in $BASHRC"
fi

echo "Installation complete ($INSTALL_DIR)"
echo "Command available on shell restart: $COMMAND_NAME"
