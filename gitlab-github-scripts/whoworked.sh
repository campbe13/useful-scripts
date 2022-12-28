#!/bin/bash
# pmc
# 2022-12-28
#
# assumes cwd is top of tree for projet, 
# locates  all files for proj w find, assign to var
# run git blame across all files in var
#
# stolen from stack overflow 
# https://stackoverflow.com/questions/4589731/git-blame-commit-statistics

# changes: find all files in cwd tree & use as param
# note: adding --incremental maybe easier to read / evaluate
# see https://git-scm.com/docs/git-blame

# note to make this faster, work on all proj in a dir, see all-work.sh  it will run it against all dirs in cwd

echo $(basename "$PWD")
files=$(find ./)
git ls-tree -r -z --name-only HEAD -- $files  | sed 's/^/.\//' | xargs -0 -n1 git blame \
   --line-porcelain --incremental HEAD |grep -ae "^author "|sort|uniq -c|sort -nr
