#!/bin/bash
# pmcampbell
# 2024-03-01
# given a list of hosts, check if the apache manual was installed
if [[ $# < 1 ]] ; then
   echo $(basename $0) need a file of hosts to check as cli arg
   exit 1
fi

for i in  `cat $1` ; do
    wget $i/manual  -O $i.html
done
