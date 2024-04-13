#!/bin/bash
# pmcampbell
# 2021-01-12
# given a list of hosts, 

# copy a script   & run it on the remote
# this one does the client check
# IMPORTANT file must be space delimited (tab reads only 1st )

if [[ $# -ne  1 ]] ; then
   echo $(basename $0) need a file of hosts to check as cli arg
   echo and a file with domain and line as fields 1 \& 2
   exit 1
fi

copyfile=client.sh
if [[ ! -f $copyfile ]]  ; then
    exit 2
fi

if [[ ! -d fbassig3 ]]  ; then
    mkdir fbassig3
fi

# need the -u 5 for io or it uses stdin & reads only 1st line
# multi args use while
while read -u 5 -r domain client ; do
    echo "domain=$domain on $client" 
    if [[ ! -d fbassig3/$domain ]] ; then
       mkdir fbassig3/$domain
    fi
    feedback=fbassig3/$domain/client-using-domain-$client.txt
    echo "domain=$domain" > args.client
    echo "client=$client" > args.client
    scp $copyfile args.client teacher@$client:~/
    echo "START>>>$client $domain" >$feedback
    ssh teacher@$client ~/$copyfile >> $feedback
done 5< $1
