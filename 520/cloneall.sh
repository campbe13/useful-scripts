#!/bin/bash
# given a list of ids, clone all repos
# repos in the common group 520-01-F22 are created by other scripts
# 1st is with student id
# subsequent may be with team names (so instead of id use team)

# clone one branch only (not main)

# 2022-09-28

# afterward if you run
# grep fatal */errors-cloning.txt 
# whatever ids show either had the wrong repo name or wrong branch

# result is 1 directory per id with the cloned repo 

branch=A1
sect=section02
for id in `cat all-ids.txt` ; do
  if [[ ! -d $id ]] ; then 
	mkdir $id
  fi
  cd $id
  git clone --single-branch --branch $branch git@gitlab.com:520-01-F22/$sect/$id/assignment1.git 2>errors-cloning.txt
  cd - >/dev/null
done