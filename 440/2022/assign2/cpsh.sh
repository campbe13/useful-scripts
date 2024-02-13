#!/bin/bash
# pmcampbell
# 2021-01-12
# given a list of hosts, 
#  run a command on a host

if [[ $# < 1 ]] ; then
   echo $(basename $0) need a file of hosts to check as cli arg
   exit 1
fi


countok=0
countbad=0
# multi args use while
#while read -r i domain server client ; do
# single host name in file, use for
 for i in  `cat $1` ; do
    if [[ $i =~ ^# ]] ; then
       echo comment $i
       continue
    fi
    echo  "START>>>$i  "
    scp  tricia@$i:/usr/local/bin/checkmuppets.sh $i.ckmuppets.sh 
done
#done < $1
