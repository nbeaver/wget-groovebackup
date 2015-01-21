#! /usr/bin/env bash

URL="http://groovebackup.com/?lang=en"
DOWNLOAD_FOLDER="$HOME/backup/grooveshark-backup/"

COOKIE_FILE="$(dirname $0)/cookies.txt"
LOG_FILE="$(dirname $0)/wget.log"
mkdir --parents "$DOWNLOAD_FOLDER"
wget --load-cookies "$COOKIE_FILE" \
	--output-file "$LOG_FILE" \
	--directory-prefix "$DOWNLOAD_FOLDER" \
	--wait 0.25 \
	--recursive --convert-links --server-response "$URL" \
	--reject index.html?lang=de,index.html?lang=dk,logout
