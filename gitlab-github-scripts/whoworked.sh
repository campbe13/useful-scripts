#!/bin/bash
# pmc
# 2022-12-28
#
# stolen from stack overflow 
# https://stackoverflow.com/questions/4589731/git-blame-commit-statistics
# note: put the file spec in single quotes, ex '*.*js'
  
if [[ $# -ne 1 ]] ; then
   echo $(basename $0) need file spec ex \'*/*js\'
   exit 1
fi

git ls-tree -r -z --name-only HEAD -- $1  | sed 's/^/.\//' | xargs -0 -n1 git blame \
   --line-porcelain HEAD |grep -ae "^author "|sort|uniq -c|sort -nr
