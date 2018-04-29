#!/bin/bash 
# PMC
# 2018-04-29
# renamedotjava.sh
#
# rename moodle .java files
# moodle now zips into a directory structure, need to change
#
#  1st get rid of spaces 1st see rename1Space.sh
#  2nd rename  to first name  from Firstname_blahblah.java Firstname.java see rename2.sh
#  3rd use the file name to insert it as a class name see rename3Class.sh
#
if [[ $# -le 0 ]] ; then
    echo $(basename $0) need a list of dir/File.java
    exit 2
fi
# rename to 1st name only
for i in $*
 do
  nm=$(echo $i |cut -d "_" -f 1).java
  echo original: $i renamed to: $nm 
  mv $i $nm
 done
