#!/bin/bash

# get firebase references for each
fn="../fbrefs.$(date +%F)"
for i in $(ls) ; do 
  if [[ -d $i ]] ; then
      cd $i
      echo $i >>$fn.txt
      grep getReference   $(find ./ -name "*kt"|grep -vi test) |grep -v import >>$fn.txt
      cd ..
 fi 
done

