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
sect2=~/scripts/320-js-repos-tricia-sect02.txt
sect1=~/scripts/320-js-repos-jaya-sect01.txt
fn=$sect2
teacher=tricia

usage () {
    echo $(basename $0) 1 '|' 2
    echo section 1 jaya, section 2 tricia
}
if [[ $# -ne 1 ]] ; then 
     usage
     exit 2
elif [[ $1 -eq 1 ]] ; then 
     fn=$sect1
     teacher=jaya
elif [[ $1 -ne 2 ]] ; then 
    usage
    exit 3
fi
date=$(date +%F)
time=$(date +%H.%M)
dir=~/scripts/project.$teacher.$date.$time
err=~/error.$date.$time
if   [[ ! -f $fn ]] ;  then
     echo $(basename $0) needs a list of repos in $fn
     exit 5
fi
if   [[ ! -d $dir ]] ;  then
 mkdir $dir
fi
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
 		echo  error $err repo  $i >> $err
	fi
done
echo cloned $((count-errct)) repos  
echo in error $errct 
echo see errors in ../errors.$date.txt
