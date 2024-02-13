#!/bin/bash
# pmcampbell
# 2021-04-14
# given a list of hosts, check which are up via quiet ping
# use the first arg of a multi arg file

if [[ $# < 1 ]] ; then
   echo $(basename $0) need a file of hosts to check as cli arg
   exit 1
fi

countup=0
countdown=0
while read -r i domain server client ; do
    if [[ $i  =~ ^# ]] ; then
       continue ; fi
    ping -c 2 -q $i  >/dev/null
    if [[ $? -eq 0 ]] ; then
       echo UP   $i 
       ((countup++))
    else
       echo DOWN $i
       ((countdown++))
    fi
done < $1

