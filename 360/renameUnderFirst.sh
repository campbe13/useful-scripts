#!/bin/bash 
# PMC
# 2016-02-20
# rename moodle .java files
#
#  get rid of spaces
#
if [[ "$1" == "rename" ]] ; then
  IFS=$(echo -en "\n\b")
  for file in $(ls *.java )
  do
   # replace spaces w underscores
   mv "$file" "${file/ /_}";
   unset IFS
  done
fi

# rename to 1st name only
unset IFS
for i in `ls *.java `
 do
  nm=$(echo $i |cut -d "_" -f 1).java
  echo original: $i renamed to: $nm 
  mv $i $nm
 done
