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
# mods:
# if the repo name is duplicated git will not try to clone
# into the same directory it returns 128 so i check
# for 128, parse the git id & create a new directory
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
if   [[ ! -f $fn ]] ;  then
     echo $(basename $0) needs a list of repos in $fn
     exit 5
fi

date=$(date +%F)
time=$(date +%H.%M)
dir=~/scripts/project.$teacher.$date.$time
errorfile=~/scripts/error.$teacher.$date.$time-clone.txt
if   [[ ! -d $dir ]] ;  then
 mkdir $dir
fi
cd $dir
count=0
errct=0
for i in $(cat $fn) ;  do
	((count++))
	echo cloning $i  >> $errorfile
    git clone $i  2>> $errorfile
	err=$?
    if [[ $err -eq 128 ]] ; then   # directory exists 
        newdir=$(echo $i|cut -f 2 -d ":"|cut -f 1 -d "/")
        mkdir $newdir
        cd $newdir
        git clone $i  2>> $errorfile
        err=$?
    fi
    if [[ $err -ne 0 ]] ; then
		(( errct++ ))
 		echo  error $err repo  $i >> $errorfile
	fi
done
echo cloned $((count-errct)) repos >> $errorfile
echo in error $errct >> $errorfile

if [[ $teacher == "jaya" ]] ; then
    email="jnilakantan@dawsoncollege.qc.ca"
else
    email="pcampbell@dawsoncollege.qc.ca"
fi
cat $errorfile | mail -s "results clone project2 " $email 
