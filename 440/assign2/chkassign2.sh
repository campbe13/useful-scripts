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
    scp assign2-2.sh tricia@$i:~/
    echo "START>>>$i"
    ssh tricia@$i ~/assign2-2.sh
done

echo success $countok
echo fail  $countbad
