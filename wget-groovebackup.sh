#! /usr/bin/env bash

if test -z "$1"
then
    echo "Usage: wget-groovebackup.sh /path/to/download/folder/"
    exit 1
fi

DOWNLOAD_FOLDER="$1"

URL="http://groovebackup.com/?lang=en"

SCRIPT_DIR="$( dirname "$( readlink --canonicalize "${BASH_SOURCE[0]}" )" )"

COOKIE_FILE="$SCRIPT_DIR/cookies.txt"
LOG_FILE="$SCRIPT_DIR/wget.log"

if ! hash wget
then
    echo "Error: Please install wget."
    exit 1
fi

if ! wget --spider 'http://www.google.com' &> /dev/null
then
    echo "Error: wget cannot spider google.com. Check internet connection."
    exit 1
fi

# Unfortunately, groovebackup cannot do https.
if ! wget --spider "http://groovebackup.com/" &> /dev/null
then
    echo "Error: wget cannot spider groovebackup.com. Maybe it is offline?"
    exit 1
fi

mkdir --parents "$DOWNLOAD_FOLDER"
wget --load-cookies "$COOKIE_FILE" \
    --no-verbose \
    --directory-prefix "$DOWNLOAD_FOLDER" \
    --wait 0.05 \
    --recursive --convert-links --server-response "$URL" \
    --reject index.html?lang=de,index.html?lang=dk,logout |& tee "$LOG_FILE"

# The --reject doesn't really work for HTML files, unfortunately.
# http://serverfault.com/questions/73962/wget-recursive-download-but-i-dont-want-to-follow-all-links

if ! grep 'groovebackup.com/exportMusic/' "$LOG_FILE" &> /dev/null
then
    echo "Error: Could not access Grooveshark account on groovebackup.com."
    echo "       This is probably because the cookies have expired."
    echo "       Please log in to http://www.groovebackup.com and refresh cookies.txt."
    while true; do
        read -p "Open groovebackup.com in web browser? " yn
        case $yn in
            [Yy]* ) xdg-open "$URL"; break;;
            [Nn]* ) break;;
            * ) echo "Please answer yes or no.";;
        esac
    done
    exit 1
fi
