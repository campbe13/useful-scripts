#!/bin/bash 
# PMC
# 2018-02-17
# moodle now zips into a directory structure, need to change
# added -d for directory with files
# 2016-02-20
# rename moodle .java files
#
#  get rid of spaces
#
if [[ "$1" == "rename" ]] ; then
  IFS=$(echo -en "\n\b")
  for file in $(ls *_file_ -d )
  do
   # replace spaces w underscores
   mv "$file" "$(echo $file|tr ' ' '_')";
   unset IFS
  done
fi

