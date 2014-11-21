#!/bin/bash

#Usage: generate_command ORGDIR DSTDIR SRC FUNCTION
generate_command(){
    ORGDIR=$1
    DSTDIR=$2
    SRC=$3
    FUNCTION=$4
    
    LEN=${#ORGDIR}
    DST=$DSTDIR/${SRC:$LEN}
    
    OUT="$FUNCTION $DST"
    eval $OUT
}
#Exemple: generate_command "/var/" "/tmp" "/var/log/daemon.log" "echo"

