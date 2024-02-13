#!/bin/bash
# pmcampbell
# 2021-01-12
# given a list of hosts, 
# copy a script   & run it on the remote

if [[ $# < 1 ]] ; then
   echo $(basename $0) need a file of hosts to check as cli arg
   exit 1
fi
count=0
comment=0
for i in  `cat $1` ; do
    ((countb++))
    if [[ $i =~ ^# ]] ; then
       echo comment $i
       ((comment++))
       continue
    fi
    ((count++))
done
echo count before $countb
echo count after $count
echo count comment $comment 
