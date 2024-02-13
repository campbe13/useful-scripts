#!/bin/bash
# pmcampbell
# 2021-01-12
# given a list of hosts, 
# copy a script   & run it on the remote

if [[ $# < 2 ]] ; then
   echo $(basename $0) need a file of hosts to check as cli arg
   echo and a file with domain and client as fields 1 and 2
   exit 1
fi


copyfile=ckufwdns.sh
if [[ ! -f $copyfile ]]  ; then
    exit 2
fi
countok=0
countbad=0
if [[  ! -d fbassig3 ]] ; then
    mkdir fbassig3
fi
   
# multi args use while
#while read -r i domain server client ; do
# single host name in file, use for
for i in  `cat $1` ; do
    if [[ $i =~ ^# ]] ; then
       echo comment $i
       continue
    fi
    domain=$(grep -i $i $2 |cut -f 1)
    echo domain $domain
    if [[ ! -d fbassig3/$domain  ]] ; then 
	mkdir fbassig3/$domain
    fi
    feedback=fbassig3/$domain/server-fw-nestat-$i.txt
    scp $copyfile $i:~/
    echo "START>>> domain $domain server $i" >$feedback
    ssh $i ~/$copyfile >> $feedback
    echo client $client 
    echo feedback $feedback 
#done <<< $(cat $1)
#done < $1
done
