#!/bin/bash
# record asciinema to a unique file every tme
# uses date stamp  then datestamp-count
#
# pm campbell
# 2018-04-11
#
date=$(date +%F)
fn=$date
which asciineman > /dev/null
if [[ $? -ne 0 ]] ; then
     echo $0 please install asciinema 
     exit 5
fi
if [[ -f $date ]] ; then
    for i in {1..9} ; do
        echo $i
        nd=$date-$i
        if [[ ! -f $nd ]] ; then
           fn=$nd
           break
        fi
     done
fi
asciinema rec $fn
