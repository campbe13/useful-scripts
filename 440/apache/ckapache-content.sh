#!/bin/bash
# pmcampbell
# 2021-01-12
# given a list of hosts, check which are ssh accessible

if [[ $# < 1 ]] ; then
   echo $(basename $0) need a file of hosts to check as cli arg
   exit 1
fi

for i in  `cat $1` ; do
    wget --tries=1 --timeout=2 $i  -O $i.html
done
echo "\ncheck for own content 0 means own"
grep "Index of /" *.html -c | grep -v "0$"
