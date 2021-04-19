#!/bin/bash
# pmcampbell
# 2021-03-19
# given a list of hosts, check which are
# using the requested ports

if [[ $# < 1 ]] ; then
   echo $(basename $0) need a file of hosts to check as cli arg
   exit 1
fi

echo "checking ports"
for box in  `cat $1` ; do
    echo START--- $box
    nmap -p T:80,8805,8855 $box
    # --connect-timeout 15 added
    curl -s --connect-timeout 15 $box:80 >  $box.80
    echo $box 8855 1 is good: $(curl -s --connect-timeout 15 $box:8855 |tee $box.8855 |grep -c 8855 )
    echo $box 8805 1 is good: $(curl -s --connect-timeout 15 $box:8805 |tee $box.8805 |grep -c 8805 )
done
