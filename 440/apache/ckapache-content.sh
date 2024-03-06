#!/bin/bash
# pmcampbell
# 2023-03-01
# given a list of hosts, check they deployed their own content

if [[ $# < 1 ]] ; then
   echo $(basename $0) need a file of hosts to check as cli arg
   exit 1
fi

for i in  `cat $1` ; do
    wget --tries=1 --timeout=2 $i  -O $i.html
done
echo "\ncheck for own content 0 means own, if it shows here it's not own 
grep "Index of /" *.html -c | grep -v "0$"
grep "Apache2 Ubuntu Default Page" *.html -c |grep -v "0$"
