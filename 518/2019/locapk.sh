#!/bin/bash
# pmc 2019-10-17
# updating script for list or one cli arg

sn=$(basename $0)
# check if single  dir input or file which is a list
if [[ $#  -eq 0 ]] ; then
    echo $sn  need a directory or file with a list of directories for cli build
    exit 3
fi
if  [[ -f $1 ]] ; then
   list=$(cat $1)
else
   list=$1
fi  

for i in $list; do
  if [[ -d $i ]] ; then
    cd  $i 
    name=$(basename $i)
    echo $name
    echo $(find ./ -name "*.apk") 
    cd ..
  fi
done


