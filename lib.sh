#!/bin/bash

#Usage: tmp_cleaning TMPDIR
tmp_cleaning(){
	TMPDIR=$1
	rm -rf $TMPDIR/mp3car-*
}

#Usage: files_listing SRC
files_listing(){
	SRC=$1
	rm -f /tmp/mp3car-tmplst.$$
	find $1 2>/dev/null >/tmp/mp3car-tmplst.$$
	cat /tmp/mp3car-tmplst.$$ | while  read ligne ; do
		if [ -f $ligne ] ; then
			echo "$ligne is a file"
		else
			echo $ligne >>/tmp/mp3car-dirtree.$$
		fi
	done
}



#Usage: encoding_file SRC DST
encoding_file(){
	INPUT=$1
	OUTPUT=$2
	OPTIONS="--replaygain-accurate"
	OPTIONS="$OPTIONS --cbr -b 160"
	OPTIONS="$OPTIONS --add-id3v2 --id3v2-latin1 --ignore-tag-errors"
	OPTIONS="$OPTIONS --quiet"
	lame $OPTIONS $INPUT $OUTPUT
}


