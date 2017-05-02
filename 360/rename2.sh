#!/bin/bash 
# PMC
# 2016-02-20
# rename2.sh
#
# rename moodle .java files
#
#  1st get rid of spaces 1st see rename1Space.sh
#  2nd rename  to first name  from Firstname_blahblah.java Firstname.java see rename2.sh
#  3rd use the file name to insert it as a class name
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
