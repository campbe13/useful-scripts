#!/bin/bash
# pmcampbell
# 2021-02-10
# given a list of hosts, run this to cache the ssh keys
# you cannot run ssh-copy-id silently unless you have the key cached already

if [[ $# < 1 ]] ; then
   echo $(basename $0) need a file of hosts to check as cli arg
   exit 1
fi

if [[ ! -f .password ]] ; then
   echo $(basename $0) need a file .password containing your password on the remote
   exit 1
fi

echo "checking ssh "
countok=0
countbad=0
for i in  `cat $1` ; do
    sshpass -f.password ssh -oStrictHostKeyChecking=no $i exit
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
