#! /usr/bin/env bash

mkdir --parents ~/backup/grooveshark-backup/
wget --load-cookies cookies.txt \
	--output-file=wget.log \
	--directory-prefix ~/backup/grooveshark-backup/ \
	--recursive --convert-links --server-response http://groovebackup.com/home \
	--reject index.html?lang=de,index.html?lang=dk,index.html?lang=en,logout
