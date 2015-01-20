#! /usr/bin/env bash

mkdir --parents ./groovebackup/
wget --load-cookies cookies.txt \
	--output-file=wget.log \
	--directory-prefix=groovebackup/ \
	--recursive --convert-links --server-response http://groovebackup.com/home \
	--reject index.html?lang=de,index.html?lang=dk,index.html?lang=en,logout
