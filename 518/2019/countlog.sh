#!/bin/bash

# get a count of Log. statements
fn="../logcount.$(date +%F)"
for i in $(ls) ; do 
  if [[ -d $i ]] ; then
      cd $i
      echo $i >>$fn.txt
      grep -c "Log\." $(find ./ -name "*kt"|grep -vi test) |grep -v import >>$fn.txt
      cd ..
 fi 
done

