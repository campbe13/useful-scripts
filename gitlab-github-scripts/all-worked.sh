#!/bin/bash
# pmc
# 2022-12-28
#
# call who worked for all dirs in cwd


for dir in `ls` ; do
  if [[ ! -d $dir ]] ; then
   continue
  fi
  cd $dir
  echo $(basename "$PWD")
  ../whoworked.sh
  cd ..
done
