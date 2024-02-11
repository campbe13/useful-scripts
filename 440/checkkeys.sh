#!/bin/bash
# pmcampbell
# 2021-01-12
# given a list of hosts, check which are ssh accessible
# note this is to test if user tricia keys have been distributed properly
# by user tricia

if [[ $# < 1 ]] ; then
   echo $(basename $0) need a file of hosts to check as cli arg
   echo  note  student ips must be in the /etc/hosts file
   echo or you have to use ip addr list which is harder to track back

   echo \n note this is to test if user tricia keys have been distributed properly
   exit 1
fi

echo "checking ssh "
countok=0
countbad=0
for i in  `cat $1` ; do
    ssh  -q tricia@$i exit
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
