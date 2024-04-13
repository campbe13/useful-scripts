#!/bin/bash
# pmcampbell
# 2021-01-12
# given a list of hosts, 
# copy a script   & run it on the remote

if [[ $# < 2 ]] ; then
   echo $(basename $0) need a file of hosts to check as cli arg
   echo and a file with domain and line as fields 1 \& 2
   exit 1
fi

copyfile=line.sh
if [[ ! -f $copyfile ]]  ; then
    exit 2
fi

if [[ ! -d fbassig3 ]]  ; then
    mkdir fbassig3
fi

# multi args use while
# can't use read & ssh as it ends the output after 1st line ???
#while read -r domain line ; do
# single host name in file, use for
#domain=x.ca
for line in  `cat $1` ; do
#    if [[ $domain =~ ^# ]] ; then
#       continue
#    fi
# tab delimiter
    domain=$(grep -i $line $2 |cut -f 1 )
    #domain=$(grep -i $line $2 |cut -f 1 -d ' ')
    if [[ ! -d fbassig3/$domain ]] ; then
       mkdir fbassig3/$domain
    fi
    client=$(cat $line |cut -f 2)
    feedback=fbassig3/$domain/line-using-domain-$client.txt
    echo "domain=$domain on $client" 
    echo "domain=$domain" > args.client
    scp $copyfile args.line teacher@$client:~/
    echo "START>>>$client $domain" >$feedback
    ssh teacher@$client ~/$copyfile >> $feedback
#done < $1
done
