#!/bin/bash
# given a list of ids, find all .js in the dir 
# and apply eslint 
# TODO: use regex to include .mjs
#
# 2022-09-29  PMC

if [[ ! -f dirs.txt ]] ; then
    echo require dirs.txt containing directories to search
	exit 1
fi

resultfn=eslint.results.txt
if [[ -f $resultfn ]] ; then
    mv $resultfn $resultfn.$(date +%F)
fi

for id in `cat dirs.txt` ; do
  fn=$(find ./$id/ -name "*.js")
  echo $id eslint $fn |tee -a $resultfn
  eslint $fn | tee -a $resultfn
done

check results in $resultfn