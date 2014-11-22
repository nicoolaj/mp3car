#!/bin/bash

PRE_COMMAND="sudo "
eval $PRE_COMMAND apt-get update
eval $PRE_COMMAND apt-get install -y lame
eval $PRE_COMMAND apt-get install -y rsync
eval $PRE_COMMAND apt-get install -y sed gawk
