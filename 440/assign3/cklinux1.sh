#!/bin/bash

if   [[ $# -ne  1 ]] ; then
    echo $(basename $0) file.of.domains
    exit 1
elif [[ ! -f $1 ]] ; then
   echo $(basename $0) must be a file $1 is not
fi


for i in `cat $1` ; do 
  dig @localhost linux1.$i >> $i.results 
  dig @localhost teacher.$i >> $i.results 
  dig @localhost sonic.$i >> $i.results 
done

