#!/bin/bash
# pmcampbell
# 2021-01-12
# given a list of hosts, 
# copy a script   & run it on the remote

if [[ $# < 1 ]] ; then
   echo $(basename $0) need a file of hosts to check as cli arg
   exit 1
fi


copyfile=ckufwdns.sh
if [[ ! -f $copyfile ]]  ; then
    exit 2
fi

countok=0
countbad=0
# multi args use while
#while read -r i domain server client ; do
# single host name in file, use for
 for i in  `cat $1` ; do
    if [[ $i =~ ^# ]] ; then
       echo comment $i
       continue
    fi
    scp $copyfile tricia@$i:~/
    echo "START>>>$i"
    ssh tricia@$i ~/$copyfile
done
#done < $1
