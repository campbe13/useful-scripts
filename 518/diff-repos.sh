#!/bin/bash

# just not sure where to put this for now
# diff between two repos

# TODO: if no repos, ask for & read in repo names
# TODO: assuming repo1 branch master

if [[ $# -ne 2 ]] ; then
   echo UsageL basename $0 uri-repo1 uri-repo2
   exit 5
fi
repo1=$1
repo2=$2

dir=$(basename $repo1)

git clone $repo1
cd $dir
git remote add $repo2
git fetch other
git diff other/master

# ex:
# 2131  git clone git@github.com:Android518-2017/week04-resources.git
# 2132  cd week04-resources/
# 2133  git remote add conu git@github.com:Androidconu-2017/05-resources-imageswap.git
# 2134  git fetch conu
# 2135  git diff conu/master



