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

#Usage: generate_command ORGDIR DSTDIR SRC FUNCTION
generate_command(){
    ORGDIR=$1
    DSTDIR=$2
    SRC=$3
    FUNCTION=$4
    
    TMP=/tmp/mp3car-$$.mp3
    LEN=${#ORGDIR}
    DST=$DSTDIR/${SRC:$LEN}
    
    CONVERT="$FUNCTION $SRC $TMP"
    eval $OUT
    FULLDSTDIR=‘dirname $DSTDIR‘/'dirname $SRC‘
    MDIR="mkdir -p $FULLDSTDIR"
    MOVE="mv $TMP $DST"
}
#Exemple: generate_command "/var/" "/tmp" "/var/log/daemon.log" "echo"

