#!/bin/bash

# excerpted from zclassic/zutil/init-mac.sh

if [ ! -f "$HOME/Library/Application Support/Zcash/zcash.conf" ]; then
	echo "Creating zcash.conf"
	mkdir -p "$HOME/Library/Application Support/Zcash/"
	echo "rpcuser=zcashrpc" > ~/Library/Application\ Support/Zcash/zcash.conf
	PASSWORD=$(cat /dev/urandom | env LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
	echo "rpcpassword=$PASSWORD" >> "$HOME/Library/Application Support/Zcash/zcash.conf"
	echo "Complete!"
fi
