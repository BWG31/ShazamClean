#!/bin/bash

INSTALL_DIR="$HOME/.config/ShazamClean"
COMMAND_NAME="42clean"
SCRIPT_ALIAS="alias $COMMAND_NAME="
ZSHRC="$HOME/.zshrc"
BASHRC="$HOME/.bashrc"

grep -v "$SCRIPT_ALIAS" $ZSHRC > temp.txt && mv temp.txt $ZSHRC
grep -v "$SCRIPT_ALIAS" $BASHRC > temp.txt && mv temp.txt $BASHRC

rm -rf $INSTALL_DIR

echo "$INSTALL_DIR removed"
echo "aliases removed"
echo "Successfully uninstalled ShazamClean (42clean)"
