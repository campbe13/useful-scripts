#!/bin/bash
# pmc
# rename java source files downloaded from moodle (before this must change blank to underscores
# TODO
# merge in changing blanks to underscores w tr or sed
#
for i in $(ls *assignsubmission*java)
do
  #echo $i
  fn=$(echo $i |cut -d _ -f 6)
  mv $i $fn
done
