#!/bin/bash
# pmcampbell
# 2021-01-12
# given a list of hosts, 
# copy a script   & run it on the remote

if [[ $# < 1 ]] ; then
   echo $(basename $0) need a file of hosts to check as cli arg
   exit 1
fi

copyfile=client.sh
if [[ ! -f $copyfile ]]  ; then
    exit 2
fi

countok=0
countbad=0
# multi args use while
# can't use read & ssh as it ends the output after 1st line ???
#while read -r domain client ; do
# single host name in file, use for
domain=x.ca
for client in  `cat $1` ; do
    if [[ $domain =~ ^# ]] ; then
       continue
    fi
    domain=$(grep $client clientdomain.txt |cut -f 1)
    echo "domain=$domain" > args.client
    scp $copyfile args.client tricia@$client:~/
    echo "START>>>$client $domain"
    ssh tricia@$client ~/$copyfile
#done < $1
done
