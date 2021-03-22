#!/bin/bash
# pmcampbell
# 2021-01-12
# given a list of hosts, check which are ssh accessible

if [[ $# < 1 ]] ; then
   echo $(basename $0) need a file of hosts to check as cli arg
   exit 1
fi

echo "checking ssh "
countok=0
countbad=0
for i in  `cat $1` ; do
    ssh tricia@$i
    if [[ $? -eq 0 ]] ; then
       echo success   $i 
       ((countok++))
    else
       echo fail $i
       ((countbad++))
    fi
done

echo success $countok
echo fail  $countbad
