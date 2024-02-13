#!/bin/bash
# assignment 4 dns
# verify student config 
# pmcampbell
# 2021-04-08

if [[ $# < 1 ]] ; then
   echo $(basename $0) need a file of hosts to check as cli arg
   exit 1
fi

while read -r dns domain server client ; do

 if [[ $dns  =~ ^# ]] ; then
       echo $i
       continue ; fi

#    echo $dns.$domain
#    echo $domain
#    echo $server.$domain
#    echo $client.$domain
 echo '>>>START  ' $dns $domain
 echo -n "dig +short @$dns tricia.$domain "
 dig +short @$dns tricia.$domain
 echo -n "dig +short @$dns pcampbell.$domain "
 dig +short @$dns pcampbell.$domain
 echo -n "dig +short @$dns teacher.$domain "
 dig +short @$dns teacher.$domain

 echo -n "dig +short @$dns sonic.$domain "
 dig +short @$dns sonic.$domain
 echo -n "dig +short @$dns korra.$domain "
 dig +short @$dns korra.$domain

 #server=trevormccubbin
 #client=grigorlinuxvm
 echo -n "dig +short @$dns $client.$domain "
 dig +short @$dns $client.$domain
 echo -n "dig +short @$dns $server.$domain "
 dig +short @$dns $server.$domain

done < $1
