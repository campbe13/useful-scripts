#!/bin/bash
# pmc
# 2019-11-18
# check all repos


fn='all.git.remote.show.origin.txt'
if [[ -e $fn ]] ; then
   mv $fn $fn.$(date +%F)
fi
for i in $(ls); do 
if [[ -d $i ]] ; then 
	cd $i
	git remote show origin >>../$fn
	cd ..
fi 
done 
