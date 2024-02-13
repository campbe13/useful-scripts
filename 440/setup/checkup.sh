#!/bin/bash
# pmcampbell
# 2021-01-12
# given a list of hosts, check which are up via quiet ping

if [[ $# < 1 ]] ; then
   echo $(basename $0) need a file of hosts to check as cli arg
   exit 1
fi

echo "checking if $1 up"
countup=0
countdown=0
for i in  `cat $1` ; do
    ping -c 2 -q $i  >/dev/null
    if [[ $? -eq 0 ]] ; then
       echo UP   $i 
       ((countup++))
    else
       echo DOWN $i
       ((countdown++))
    fi
done

echo UP $countup
echo DOWN  $countdown
