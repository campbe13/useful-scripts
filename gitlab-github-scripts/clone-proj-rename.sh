#!/bin/bash
# clone project (originally  for android)
# tested with github & gitlab

# NOTE:  change fn  to list of repost to clone
# NOTE:  change dir  the directory you want to create/use
#
# created 2019-fall
# pmcampbell
#
# This script assumes you have an ssh key 
# installed on the git host (gitlab, github)
# my key has no password so that I can run it automatically
# I usually run it as a cron job just after the deadline 
#
# 2021-11-09
# modified to rename the cloned directory (repo name) to the gitlab id
# they use generic & difficult to parse names
#
date=$(date +%F)
time=$(date +%H.%M)
dir=./repos
err=error.$date.H$time
fn=list   
if   [[ ! -f $fn ]] ;  then
     echo $(basename $0) needs a list of repos in $fn
     exit 5
fi
if   [[ ! -d $dir ]] ;  then
 mkdir $dir
fi
cp $fn $dir # copy of list of files
cd $dir
count=0
errct=0
for i in $(cat $fn) ;  do
	studentgit=$(echo $i |cut -d ":" -f 2|cut -d "/" -f 1)
	studentdir=$(echo $i |cut -d "/" -f2 |cut -d "." -f  1)
	((count++))
	echo cloning $i 
        git clone $i
	err=$?
        if [[ $err -ne 0 ]] ; then
		(( errct++ ))
 		echo  error $err repo  $i >> ../errors.$date.txt 
	else
		echo "renaming mv $studentdir $studentgit "
		mv $studentdir $studentgit
	fi
done
echo cloned $((count-errct)) repos  
echo in error $errct 
echo see errors in ../errors.$date.txt
