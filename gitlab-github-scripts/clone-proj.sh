#!/bin/bash
# clone project (originally  for android)
# tested with github & gitlab

# NOTE:  change fn  to list of repost to clone
# NOTE:  change dir  the directory you want to create/use
#
# last modified 2019-fall
# pmcampbell
#
# This script assumes you have an ssh key 
# installed on the git host (gitlab, github)
# my key has no password so that I can run it automatically
# I usually run it as a cron job just after the deadline 
#
# change the dir=, fn= and err= as you wish
#
date=$(date +%F)
time=$(date +%H.%M)
dir=project2.$date.H$time
err=error.$date.H$time
fn=list.txt
if   [[ ! -f $fn ]] ;  then
     echo $(basename $0) needs a list of repos in $fn
     exit 5
fi
if   [[ ! -d $dir ]] ;  then
 mkdir $dir
fi
cp $fn $dir
cd $dir
count=0
errct=0
for i in $(cat $fn) ;  do
	((count++))
	echo cloning $i 
        git clone $i 
	err=$?
        if [[ $err -ne 0 ]] ; then
		(( errct++ ))
 		echo  error $err repo  $i >> ../errors.$date.txt 
	fi
done
echo cloned $((count-errct)) repos  
echo in error $errct 
echo see errors in ../errors.$date.txt
