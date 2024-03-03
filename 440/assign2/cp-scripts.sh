#!/bin/bash
# pmcampbell
# 2024-3-3
# given a list of hosts, 
#  copy a file to the host

if [[ $# < 1 ]] ; then
   echo $(basename $0) need a file of hosts to check as cli arg
   exit 1
fi


countok=0
countbad=0
# multi args use while
#while read -r i domain server client ; do
# possible to have single host name in file, use for
for i in  `cat $1` ; do
    if [[ $i =~ ^# ]] ; then
       echo comment $i
       continue
    fi
    echo  "START>>>$i  "
    scp  a2-run.sh a2-check-container.sh  teacher@$i:
    
done
#done < $1
