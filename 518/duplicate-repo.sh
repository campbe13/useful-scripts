#!/bin/bash

# duplicate a repo, see  https://help.github.com/articles/duplicating-a-repository/
# just not sure where to put this for now
# maintains the commit history but decouples it 
# use when you don't want the fork relationship / connection
# use when you want to go from public to private 

# TODO: if no repos, ask for & read in repo names

if [[ $# -ne 2 ]] ; then
   echo UsageL basename $0 uri-repo1 uri-repo2
   exit 5
fi
oldrepo1=$1
newrepo2=$2

# remove leading uri 
dir=$(basename $oldrepo1)

git clone --bare $oldrepo1
cd $dir
git push  --mirror $newrepo2  
cd .. ; rm -rf $dir  # delete the local bare repo

# ex:
