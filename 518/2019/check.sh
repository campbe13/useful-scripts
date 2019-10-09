#!/bin/bash

# check they didn't do some weird directory structure

for i in $(ls) ; do 
  if [[ -d $i ]] ; then
    if [[ -f $i/gradlew ]] ; then  
	((countok++)) 
   else
	 ((countbad++))
        echo $i
 fi 
 fi 
done
echo ok $countok, bad $countbad

