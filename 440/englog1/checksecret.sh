#!/bin/bash
# pmcampbell
# 2021-03-19
# given a list of hosts, check which are
# configured / set up for userdir tricia

if [[ $# < 1 ]] ; then
   echo $(basename $0) need a file of hosts to check as cli arg
   exit 1
fi
rm secret.log   # remove old file
echo "checking user/pass /secret"
for box in  `cat $1` ; do
    echo checking $box >> secret.log
    wget -O - --user tricia --password tricia $box/secret  >> secret.log
    
done
