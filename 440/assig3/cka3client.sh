#!/bin/bash
# pmcampbell
# 2021-01-12
# given a list of hosts, 
# copy a script   & run it on the remote

if [[ $# < 2 ]] ; then
   echo $(basename $0) need a file of hosts to check as cli arg
   echo and a file with domain and client as fields 1 \& 2
   exit 1
fi

copyfile=client.sh
if [[ ! -f $copyfile ]]  ; then
    exit 2
fi

if [[ ! -d fbassig3 ]]  ; then
    mkdir fbassig3
fi

# multi args use while
# can't use read & ssh as it ends the output after 1st line ???
#while read -r domain client ; do
# single host name in file, use for
#domain=x.ca
for client in  `cat $1` ; do
#    if [[ $domain =~ ^# ]] ; then
#       continue
#    fi
    domain=$(grep -i $client $2 |cut -f 1)
    if [[ ! -d $domain ]] ; then
       mkdir fbassig3/$domain
    fi
    feedback=fbassig3/$domain/client-using-domain-$client.txt
    echo "domain=$domain on $client" 
    echo "domain=$domain" > args.client
    scp $copyfile args.client tricia@$client:~/
    echo "START>>>$client $domain" >$feedback
    ssh tricia@$client ~/$copyfile >> $feedback
#done < $1
done
