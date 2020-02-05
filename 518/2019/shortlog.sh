#!/bin/bash

# get git log info 
fn="../shortlog.$(date +%F)"
for i in $(ls) ; do 
  if [[ -d $i ]] ; then
      cd $i
      echo $i >>$fn.txt
      git shortlog -s --no-merges >>$fn.txt
      echo $i >>$fn.detail.txt
      git shortlog  >>$fn.detail.txt
      echo $i >>$fn.nomerge.txt
      git shortlog --no-merges >>$fn.nomerge.txt
      cd ..
 fi 
done

