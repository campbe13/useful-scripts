#!/bin/bash
# pmcampbell
# 2021-02-10
# given a list of hosts, run this to execute a single command in CMD
# expects that you have the ssh keys on the target list
# CMD="" will just shell in

if [[ $# < 1 ]] ; then
   echo $(basename $0) need a file of hosts to check as cli arg
   exit 1
fi

CMD='echo -e "linuxyay!\nilovelinux+" | passwd $i'
echo "over ssh running $CMD "
countok=0
countbad=0
for i in  `cat $1` ; do
    ssh $i  echo -e "linuxrocks\ncovidsucks" | passwd
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
