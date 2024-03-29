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
#done < $1
# single host name in file, use for
 for i in  `cat $1` ; do
    if [[ $i =~ ^# ]] ; then
       echo comment $i
       continue
    fi
    echo -e "START>>>$i  "
    ssh tricia@$i ls -la /usr/local/bin/*.sh
    ssh tricia@$i ls -ld /usr/local/muppet* 
    ssh tricia@$i ls -l /usr/local/muppet*
done
