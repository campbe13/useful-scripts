#!/bin/bash 
# PMC
# 2016-02-20
# rename moodle .java files
#
#  get rid of spaces 1st see rename1Space.sh
#  rename  to first name  from Firstname_blahblah.java Firstname.java
#
if [[ $# -le 0 ]] ; then
    echo $(basename $0) need a list of files
    exit 2
fi
# rename to 1st name only
for i in $*
 do
  nm=$(echo $i |cut -d "_" -f 1).java
  echo original: $i renamed to: $nm 
  mv $i $nm
 done
