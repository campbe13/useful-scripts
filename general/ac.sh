#!/bin/bash
# record asciinema to a unique file every tme
# uses date stamp  then datestamp-count
# TODO increase limit of 9 per day &/or warn
#
# pm campbell
# 2018-04-12
#
# first check if it's installed
which asciinema > /dev/null  2>&1
if [[ $? -ne 0 ]] ; then
     echo $bn please install asciinema 
     exit 5
fi
# now check for a title
bn=$(basename $0)
if [[ $# -ne 1 ]] ; then
  echo Usage: $bn "asciinema title here" 
  exit 1
fi
title=$1
# record it!
date=$(date +%F)
fn=$date.cast
# fault, maximum 9 recordings in a day
if [[ -f $date.cast ]] ; then
    for i in {1..9} ; do
        echo $i
        nd=$date-$i.cast
        if [[ ! -f $nd ]] ; then
           fn=$nd
           break
        fi
     done
fi
echo $bn recording to $fn
echo asciinema play $fn will playback the cast
asciinema rec -t $title $fn
