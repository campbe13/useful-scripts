#!/bin/bash
# pmc
# 1 mkdir with ist part of file name fname_lname...java
# 2 mv file to 
# rename java source files downloaded from moodle (before this must change blank to underscores
# TODO
# merge in changing blanks to underscores w tr or sed
#
if [[ $# -ne 1 ]] ; then
    echo "Missing class name - single argument"
	exit 1
fi
class=$1

for i in $(ls *assignsubmission*java)
do
  #echo $i
  #  get name for dir
  dn=$(echo $i |cut -d _ -f 1)
  mkdir $dn
  cp $i $dn/
  mv $i $dn/$class.java
done
