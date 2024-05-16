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

#CMD="docker ps"
# using start, not run
#CMD="docker start assignment2"
if [[ -e .CMD ]] ; then 
    CMD=$(cat .CMD)
elif  [[ -e CMD ]] ; then
    CMD=$(cat CMD)
else
    echo need a command to run remotely in \.CMD or CMD
    ech will run ssh only
fi
echo "over ssh running $CMD "
countok=0
countbad=0
for i in  `cat $1` ; do
    echo HOST $i
    ssh $i $CMD
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
