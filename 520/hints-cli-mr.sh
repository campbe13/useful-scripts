#!/bin/bash

# trying command line MR
# https://docs.gitlab.com/ee/user/project/push_options.html

# draft:
# -o  merge_request.draft
# target: (if not curr branch)
# -o  merge_request.target=<branch_name>	
if [[ $# -ne 1 ]] ; then
   echo Usage $(basename $0) branch_name
   exit 1
fi

git push -o merge_request.create  -o merge_request.description="mr for minor edits 06.1" -o merge_request.assign="j-nila" -o merge_request.assign="campbe13" origin $1
